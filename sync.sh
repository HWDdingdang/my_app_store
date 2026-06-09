#!/bin/bash
set -e

REPO_URL="https://github.com/HWDdingdang/my_app_store.git"
REPO_DIR="/opt/my_app_store"
APPSTORE_DIR="/opt/1panel/resource/apps/local"

echo "========== my_app_store Sync Started =========="

echo "1. Checking git..."
if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is not installed."
  exit 1
fi

echo "2.  Checking 1Panel local apps directory..."
if [ ! -d "$APPSTORE_DIR" ]; then
  echo "Error: Directory not found: $APPSTORE_DIR"
  exit 1
fi

echo "3. Pulling or updating repository..."
if [ ! -d "$REPO_DIR/.git" ]; then
  echo "First time cloning repository: $REPO_URL"
  rm -rf "$REPO_DIR"
  git clone "$REPO_URL" "$REPO_DIR"
else
  echo "Repository exists, executing git pull..."
  cd "$REPO_DIR"
  git reset --hard
  git pull
fi

echo "4. Checking apps directory..."
if [ ! -d "$REPO_DIR/apps" ]; then
  echo "Error: 'apps' directory does not exist in repository."
  exit 1
fi

echo "5. Syncing applications to 1Panel local directory..."
for app in "$REPO_DIR"/apps/*; do
  [ -d "$app" ] || continue

  app_name="$(basename "$app")"
  echo "Syncing application: $app_name"

  rm -rf "$APPSTORE_DIR/$app_name"
  cp -rf "$app" "$APPSTORE_DIR/"
done

echo "6. Current local apps directory:"
ls -la "$APPSTORE_DIR"

echo "========== my_app_store Sync Completed =========="
echo "Done! Please log in to 1Panel: App Store → Local Apps → Refresh."
