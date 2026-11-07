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

# 2. 从仓库 typst.toml 读取版本号（带超时）
VERSION="${EZEXAM_VERSION:-}"
if [ -z "$VERSION" ]; then
  VERSION=$(curl -fsSL --max-time 15 "$REPO/raw/main/typst.toml" 2>/dev/null \
    | grep -E '^[[:space:]]*version[[:space:]]*=' \
    | head -1 \
    | sed -E 's/.*"([^"]+)".*/\1/') || true
fi

# 读取失败则直接报错退出
if [ -z "$VERSION" ]; then
  echo "!! 无法从 GitHub 获取版本号。" >&2
  echo "   这通常是由于网络连接问题（如无法访问 raw.githubusercontent.com）。" >&2
  echo "   请检查网络后重试。" >&2
  exit 1
fi

# 3. 确定 Typst 本地包目录（官方数据目录 Data Dir）
case "$(uname -s)" in
  Darwin)
    BASE="$HOME/Library/Application Support/typst/packages"
    ;;
  *)
    BASE="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages"
    ;;
esac
DEST="$BASE/$NAMESPACE/$NAME/$VERSION"

# 4. 清理旧版本并浅克隆
echo "==> 安装 $NAME@$VERSION 到 $DEST"
rm -rf "$DEST"
mkdir -p "$(dirname "$DEST")"

# 直接拉取默认分支（main），并加入网络超时保护
GIT_HTTP_LOW_SPEED_LIMIT=1000 GIT_HTTP_LOW_SPEED_TIME=30 \
  git clone --depth 1 "$REPO" "$DEST" \
  || { echo "!! git clone 失败，请检查网络后重试" >&2; exit 1; }

# 5. 校验
[ -f "$DEST/typst.toml" ] || { echo "!! 仓库缺少 typst.toml" >&2; exit 1; }

# 6. 清理 .git 目录，减少本地占用
rm -rf "$DEST/.git"

echo "✅ 模版导入成功！引用方式：#import \"@$NAMESPACE/$NAME:$VERSION\": *"