#!/usr/bin/env bash
set -euo pipefail

# ===== 可配置项 =====
PROXY="https://ezexam.pages.dev/proxy"
NAMESPACE="local"
NAME="ezexam"
# ====================

# 1. 获取版本号
VERSION="${EZEXAM_VERSION:-}"
if [ -z "$VERSION" ]; then
  VERSION=$(curl -fsSL --max-time 15 "$PROXY/raw/main/typst.toml" 2>/dev/null \
    | grep -E '^[[:space:]]*version[[:space:]]*=' \
    | head -1 \
    | sed -E 's/.*"([^"]+)".*/\1/') || true
fi

if [ -z "$VERSION" ]; then
  echo "!! 无法获取版本号，请检查网络后重试。" >&2
  exit 1
fi

# 2. 确定 Typst 本地包目录
case "$(uname -s)" in
  Darwin) BASE="$HOME/Library/Application Support/typst/packages" ;;
  *)      BASE="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages" ;;
esac
DEST="$BASE/$NAMESPACE/$NAME/$VERSION"

# 3. 下载并解压
echo "==> 导入 $NAME@$VERSION 到 $DEST"
TMP_ZIP="/tmp/ezexam-${VERSION}.zip"
TMP_DIR="/tmp/ezexam-extract-${VERSION}"

rm -rf "$DEST" "$TMP_ZIP" "$TMP_DIR"
mkdir -p "$(dirname "$DEST")" "$TMP_DIR"

echo "==> 正在下载模版..."
curl -fsSL --max-time 30 "$PROXY" -o "$TMP_ZIP" || { echo "!! 下载失败" >&2; exit 1; }

echo "==> 正在解压..."
# 系统自带 unzip (macOS/Linux)
unzip -q "$TMP_ZIP" -d "$TMP_DIR" || { echo "!! 解压失败" >&2; exit 1; }

# GitHub 压缩包解压后默认带一个 ezexam-main 的文件夹，把它移过去
mv "$TMP_DIR"/* "$DEST"

# 清理临时文件
rm -rf "$TMP_ZIP" "$TMP_DIR"

echo "✅ 导入成功！引用方式："
echo "   #import \"@$NAMESPACE/$NAME:$VERSION\": *"