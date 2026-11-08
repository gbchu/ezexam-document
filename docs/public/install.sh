#!/usr/bin/env bash
set -euo pipefail

# ===== 可配置项 =====
PROXY_URL="https://ezexam.pages.dev/proxy"
NAMESPACE="local"
NAME="ezexam"
# ====================

# 1. 智能测速：直连优先，失败则降级代理（静默执行）
VERSION_URL=""
ZIP_URL=""

if curl -fsSL --max-time 3 "https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml" > /dev/null 2>&1; then
  VERSION_URL="https://raw.githubusercontent.com/gbchu/ezexam/main/typst.toml"
  ZIP_URL="https://github.com/gbchu/ezexam/archive/refs/heads/main.zip"
else
  VERSION_URL="$PROXY_URL/raw/main/typst.toml"
  ZIP_URL="$PROXY_URL"
fi

# 2. 获取版本号（带 3 次重试）
VERSION="${EZEXAM_VERSION:-}"
if [ -z "$VERSION" ]; then
  for i in {1..3}; do
    VERSION=$(curl -fsSL --max-time 10 "$VERSION_URL" 2>/dev/null \
      | grep -E '^[[:space:]]*version[[:space:]]*=' | head -1 | sed -E 's/.*"([^"]+)".*/\1/') || true
    if [ -n "$VERSION" ]; then break; fi
    sleep 1
  done
fi

if [ -z "$VERSION" ]; then
  echo "!! 无法获取版本号。请检查网络，或稍后重试。" >&2
  exit 1
fi

# 3. 确定 Typst 本地包目录
case "$(uname -s)" in
  Darwin) BASE="$HOME/Library/Application Support/typst/packages" ;;
  *)      BASE="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages" ;;
esac
DEST="$BASE/$NAMESPACE/$NAME/$VERSION"

# 4. 下载并解压
echo "==> 导入模版 $NAME@$VERSION 到 $DEST"
TMP_ZIP="/tmp/ezexam-${VERSION}.zip"
TMP_DIR="/tmp/ezexam-extract-${VERSION}"

rm -rf "$DEST" "$TMP_ZIP" "$TMP_DIR"
mkdir -p "$(dirname "$DEST")" "$TMP_DIR"

echo "==> 正在下载模版..."
DOWNLOAD_SUCCESS=0
for i in {1..3}; do
  if curl -fsSL --max-time 30 "$ZIP_URL" -o "$TMP_ZIP"; then
    DOWNLOAD_SUCCESS=1
    break
  fi
  sleep 1
done

if [ "$DOWNLOAD_SUCCESS" -ne 1 ]; then
  echo "!! 下载失败，请检查网络后重试。" >&2
  exit 1
fi

if ! file "$TMP_ZIP" | grep -q "Zip archive"; then
  echo "!! 下载的文件不是 Zip 压缩包，可能被网络拦截。" >&2
  exit 1
fi

echo "==> 正在解压..."
unzip -q "$TMP_ZIP" -d "$TMP_DIR" || { echo "!! 解压失败" >&2; exit 1; }

# 5. 清理不需要的文件并移动
rm -rf "$TMP_DIR/ezexam-main/template"
rm -f "$TMP_DIR/ezexam-main/thumbnail.png" "$TMP_DIR/ezexam-main/README.md" "$TMP_DIR/ezexam-main/LICENSE"

mv "$TMP_DIR/ezexam-main" "$DEST"
rm -rf "$TMP_ZIP" "$TMP_DIR"

echo "✅ 模版导入成功！引用方式："
echo "   #import \"@$NAMESPACE/$NAME:$VERSION\": *"