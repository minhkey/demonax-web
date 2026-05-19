#!/bin/bash
# Production map sync script
# Copies the entire map directory from demonax-mapper to _site/map/
# Use this for production builds or when deploying to a server
# For development, use dev.sh which creates a symlink instead

SOURCE="$HOME/repos/demonax-mapper/output/"
DEST="/home/cmd/repos/demonax-web/_site/map/"
mkdir -p "$DEST"
rsync -av --delete "$SOURCE" "$DEST"
echo "Map synced to _site/map/ successfully"
