#!/bin/sh

set -euo pipefail

rsync -av local/ ~/.local/
rsync -av config/ ~/.config/
rsync -av home/ ~/


TMUX_PLUGIN_DIR=$HOME/.tmux/plugins/tpm 

# Install tmux plugin manager
if [ ! -d "$TMUX_PLUGIN_DIR" ]; then
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$TMUX_PLUGIN_DIR"
fi

systemctl --user enable --now tmux-start.service
systemctl --user enable --now tmux-stop.service

