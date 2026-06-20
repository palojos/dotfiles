#!/bin/sh

set -e

rsync -av config/ ~/.config/

rsync -av home/ ~/
