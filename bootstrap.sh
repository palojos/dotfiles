#!/bin/sh

set -e

rsync -av local/ ~/.local/
rsync -av config/ ~/.config/
rsync -av home/ ~/
