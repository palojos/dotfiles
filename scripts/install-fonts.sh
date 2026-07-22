#!/bin/sh
# Install JetBrainsMono Nerd Font to ~/.local/share/fonts
set -euo pipefail

FONT_VERSION="3.4.0"
LOCAL_FONT_DIR="$HOME/.local/share/fonts"
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v${FONT_VERSION}/JetBrainsMono.tar.xz"

mkdir -p "$LOCAL_FONT_DIR"

tempfile=$(mktemp)

echo "Downloading JetBrainsMono Nerd Fonts v${FONT_VERSION}..."
curl -fsSL "$URL" -o "$tempfile"

echo "Extracting fonts..."
tar -xf "$tempfile" -C "$LOCAL_FONT_DIR" --wildcards '*.ttf'
rm -f "$tempfile"

echo "Refreshing font cache..."
fc-cache -fv "$LOCAL_FONT_DIR"

echo "Done. JetBrainsMono Nerd Font installed."
