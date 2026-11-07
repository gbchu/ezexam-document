#!/usr/bin/env bash
set -euo pipefail

# ===== 可配置项 =====
REPO="${EZEXAM_REPO:-https://github.com/gbchu/ezexam}"
NAMESPACE="local"
NAME="ezexam"
# ====================

# 1. 检测 git，缺失时提示安装方式
if ! command -v git >/dev/null 2>&1; then
  echo "!! 未检测到 git，无法继续安装。" >&2
  echo "" >&2
  echo "请先安装 git：" >&2
  case "$(uname -s)" in
    Darwin)
      echo "  macOS: 运行 'xcode-select --install'，或安装 Xcode Command Line Tools" >&2
      ;;
    *)
      echo "  Linux: 使用包管理器安装，例如：" >&2
      echo "    Debian/Ubuntu : sudo apt install git" >&2
      echo "    Fedora/RHEL   : sudo dnf install git" >&2
      echo "    Arch          : sudo pacman -S git" >&2
      ;;
  esac
  exit 1
fi

# 2. 从仓库 typst.toml 读取版本号（可用 EZEXAM_VERSION 覆盖）
VERSION="${EZEXAM_VERSION:-}"
if [ -z "$VERSION" ]; then
  VERSION=$(curl -fsSL "$REPO/raw/main/typst.toml" \
    | grep -E '^[[:space:]]*version[[:space:]]*=' \
    | head -1 \
    | sed -E 's/.*"([^"]+)".*/\1/')
fi
[ -n "$VERSION" ] || { echo "!! 无法从 typst.toml 解析版本号" >&2; exit 1; }

# 3. Typst 本地包目录
case "$(uname -s)" in
  Darwin) BASE="$HOME/Library/Caches/typst/packages" ;;
  *)      BASE="${XDG_CACHE_HOME:-$HOME/.cache}/typst/packages" ;;
esac
DEST="$BASE/$NAMESPACE/$NAME/$VERSION"

# 4. 清理并浅克隆（--depth 1，只拉最新快照）
echo "==> 安装 $NAME@$VERSION 到 $DEST"
rm -rf "$DEST"
mkdir -p "$(dirname "$DEST")"
git clone --depth 1 --branch "v$VERSION" "$REPO" "$DEST" 2>/dev/null \
  || git clone --depth 1 "$REPO" "$DEST"

# 5. 校验
[ -f "$DEST/typst.toml" ] || { echo "!! 仓库缺少 typst.toml" >&2; exit 1; }

echo "✅ 导入模版完成！引用方式：#import \"@$NAMESPACE/$NAME:$VERSION\": *"