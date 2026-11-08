#!/usr/bin/env bash
set -euo pipefail

# ===== 可配置项 =====
PROXY_URL="https://ezexam.pages.dev/proxy"
GH_PROXY="https://gh-proxy.com"
DIRECT_ZIP="https://github.com/gbchu/ezexam/archive/refs/heads/main.zip"
DIRECT_VERSION="https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml"
NAMESPACE="local"
NAME="ezexam"
# ====================

# 1. 智能测速（静默执行，三级容灾）
VERSION_URL=""
ZIP_URL=""

# 首选：gh-proxy
if curl -fsSL --max-time 3 "$GH_PROXY/https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml" > /dev/null 2>&1; then
  VERSION_URL="$GH_PROXY/https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml"
  ZIP_URL="$GH_PROXY/https://github.com/gbchu/ezexam/archive/refs/heads/main.zip"
  MODE=1
# 次选：直连 GitHub
elif curl -fsSL --max-time 3 "$DIRECT_VERSION" > /dev/null 2>&1; then
  VERSION_URL="$DIRECT_VERSION"
  ZIP_URL="$DIRECT_ZIP"
  MODE=2
# 兜底：Cloudflare Pages
else
  VERSION_URL="$PROXY_URL/raw/main/typst.toml"
  ZIP_URL="$PROXY_URL"
  MODE=3
fi

# 2. 获取版本号（带重试）
VERSION="${EZEXAM_VERSION:-}"
if [ -z "$VERSION" ]; then
  for i in {1..3}; do
    if [ $i -eq 2 ] && [ "$MODE" -eq 1 ]; then
       VERSION_URL="$DIRECT_VERSION"
    elif [ $i -eq 3 ] && [ "$MODE" -eq 1 ]; then
       VERSION_URL="$PROXY_URL/raw/main/typst.toml"
    fi

    VERSION=$(curl -fsSL --max-time 10 "$VERSION_URL" 2>/dev/null \
      | grep -E '^[[:space:]]*version[[:space:]]*=' | head -1 | sed -E 's/.*"([^"]+)".*/\1/') || true

    if [ -n "$VERSION" ]; then break; fi
    sleep 1
  done
fi

if [ -z "$VERSION" ]; then
  echo "!! 无法获取版本号。您的网络环境访问 GitHub 极其不稳定。" >&2
  echo "   建议：开启代理软件（全局模式），或连接手机热点后重试。" >&2
  exit 1
fi

# 3. 确定 Typst 本地包目录
case "$(uname -s)" in
  Darwin) BASE="$HOME/Library/Application Support/typst/packages" ;;
  *)      BASE="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages" ;;
esac
DEST="$BASE/$NAMESPACE/$NAME/$VERSION"

TMP_ZIP="/tmp/ezexam-${VERSION}.zip"
TMP_DIR="/tmp/ezexam-extract-${VERSION}"

rm -rf "$TMP_ZIP" "$TMP_DIR"
mkdir -p "$TMP_DIR"

# 4. 下载源码包（交叉重试策略）
echo "==> 正在下载模版..."
DOWNLOAD_SUCCESS=0
for i in {1..3}; do
  # 重试时强制切换通道
  if [ $i -eq 2 ]; then
    if [ "$MODE" -eq 1 ]; then ZIP_URL="$DIRECT_ZIP";
    elif [ "$MODE" -eq 2 ]; then ZIP_URL="$PROXY_URL";
    else ZIP_URL="$GH_PROXY/https://github.com/gbchu/ezexam/archive/refs/heads/main.zip"; fi
  elif [ $i -eq 3 ]; then
    if [ "$MODE" -eq 1 ]; then ZIP_URL="$PROXY_URL";
    elif [ "$MODE" -eq 2 ]; then ZIP_URL="$GH_PROXY/https://github.com/gbchu/ezexam/archive/refs/heads/main.zip";
    else ZIP_URL="$DIRECT_ZIP"; fi
  fi

  if curl -fsSL --max-time 30 "$ZIP_URL" -o "$TMP_ZIP"; then
    DOWNLOAD_SUCCESS=1
    break
  fi
  sleep 1
done

if [ "$DOWNLOAD_SUCCESS" -ne 1 ]; then
  echo "!! 下载失败。您的网络环境访问 GitHub 极其不稳定。" >&2
  echo "   建议：开启代理软件（全局模式），或连接手机热点后重试。" >&2
  exit 1
fi

if ! file "$TMP_ZIP" | grep -q "Zip archive"; then
  echo "!! 下载的文件不是 Zip 压缩包，可能被网络拦截。" >&2
  exit 1
fi

# 5. 解压
echo "==> 正在解压..."
unzip -q "$TMP_ZIP" -d "$TMP_DIR" || { echo "!! 解压失败" >&2; exit 1; }

# 6. 导入并清理
echo "==> 导入模版 $NAME@$VERSION 到 $DEST"

rm -rf "$TMP_DIR/ezexam-main/template"
rm -f "$TMP_DIR/ezexam-main/thumbnail.png" "$TMP_DIR/ezexam-main/README.md" "$TMP_DIR/ezexam-main/LICENSE"

rm -rf "$DEST"
mkdir -p "$(dirname "$DEST")"
mv "$TMP_DIR/ezexam-main" "$DEST"

rm -rf "$TMP_ZIP" "$TMP_DIR"

echo "✅ 模版导入成功！引用方式："
echo "   #import \"@$NAMESPACE/$NAME:$VERSION\": *"