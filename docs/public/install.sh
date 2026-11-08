#!/usr/bin/env bash
set -euo pipefail

# ===== 可配置项 =====
PROXY="https://ezexam.pages.dev/proxy"
NAMESPACE="local"
NAME="ezexam"
# ====================

# 1. 检测 git
if ! command -v git >/dev/null 2>&1; then
  echo "!! 未检测到 git，请先安装。" >&2
  exit 1
fi

# 2. 从代理读取版本号（带超时）
VERSION="${EZEXAM_VERSION:-}"
if [ -z "$VERSION" ]; then
  VERSION=$(curl -fsSL --max-time 15 "$PROXY/raw/main/typst.toml" 2>/dev/null \
    | grep -E '^[[:space:]]*version[[:space:]]*=' \
    | head -1 \
    | sed -E 's/.*"([^"]+)".*/\1/') || true
fi

# 读取失败则报错退出
if [ -z "$VERSION" ]; then
  echo "!! 无法获取版本号，请检查网络后重试。" >&2
  exit 1
fi

# 3. 确定 Typst 本地包目录
case "$(uname -s)" in
  Darwin) BASE="$HOME/Library/Application Support/typst/packages" ;;
  *)      BASE="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages" ;;
esac
DEST="$BASE/$NAMESPACE/$NAME/$VERSION"

# 4. 从代理浅克隆仓库
echo "==> 安装 $NAME@$VERSION 到 $DEST"
rm -rf "$DEST"
mkdir -p "$(dirname "$DEST")"

# 注意这里：直接 clone 代理地址
GIT_HTTP_LOW_SPEED_LIMIT=1000 GIT_HTTP_LOW_SPEED_TIME=30 \
  git clone --depth 1 "$PROXY" "$DEST" \
  || { echo "!! git clone 失败，请检查网络后重试" >&2; exit 1; }

# 5. 校验并清理 .git
[ -f "$DEST/typst.toml" ] || { echo "!! 仓库缺少 typst.toml" >&2; exit 1; }
rm -rf "$DEST/.git"

echo "✅ 模版安装完成！引用方式：#import \"@$NAMESPACE/$NAME:$VERSION\": *"