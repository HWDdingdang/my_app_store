#!/bin/bash
set -e

# ==================== CONFIGURATION ====================
# Replace with your own 1Panel App Store repository URL
# 替换为你自己的 1Panel 应用商店扩展仓库地址
# REPO_URL="https://github.com/HWDdingdang/my_app_store.git"

# Local workspace cache directory
# 本地临时工作区缓存目录
REPO_DIR="/opt/1panel_app_store_cache"

# 1Panel local apps directory (Do not change unless custom installed)
# 1Panel 本地应用默认目录（除非自定义了面板路径，否则无需修改）
APPSTORE_DIR="/opt/1panel/resource/apps/local"
# =======================================================

echo "========== 1Panel App Store Sync Start =========="

echo "1. Checking git..."
if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is not installed."
  exit 1
fi

echo "2. Checking 1Panel Local Apps directory..."
if [ ! -d "$APPSTORE_DIR" ]; then
  echo "Error: Directory not found: $APPSTORE_DIR"
  exit 1
fi

echo "3. Cloning or Updating repository..."
if [ ! -d "$REPO_DIR/.git" ]; then
  echo "First time setup. Cloning: $REPO_URL"
  rm -rf "$REPO_DIR"
  git clone "$REPO_URL" "$REPO_DIR"
else
  echo "Repository exists. Executing git pull..."
  cd "$REPO_DIR"
  git reset --hard
  git pull
fi

echo "4. Checking 'apps' directory..."
if [ ! -d "$REPO_DIR/apps" ]; then
  echo "Error: 'apps' folder does not exist in repo: $REPO_DIR/apps"
  exit 1
fi

echo "5. Syncing applications to 1Panel..."
for app in "$REPO_DIR"/apps/*; do
  [ -d "$app" ] || continue

  app_name="$(basename "$app")"
  echo "-> Syncing application: $app_name"

  rm -rf "$APPSTORE_DIR/$app_name"
  cp -rf "$app" "$APPSTORE_DIR/"
done

echo "6. Current Local App Store contents:"
ls -la "$APPSTORE_DIR"

echo "========== 1Panel App Store Sync Finished =========="
echo "Done! Please log in to your 1Panel dashboard -> App Store -> Local Apps -> Click 'Refresh'."
