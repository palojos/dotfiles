#!/usr/bin/env bash

OPTIONS="👤 Log Out\n🔄 Restart\n⚡ Power Off"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -l 4 -no-custom -theme-str 'inputbar { enabled: false; }' )

case "$CHOICE" in
    *Log*)
        # Gracefully tells Sway to terminate your current graphical session
        swaymsg exit
        ;;
    *Restart*)
        # Orders systemd to execute a safe warm reboot cycle
        systemctl reboot
        ;;
    *Power*)
        # Orders systemd to safely flush data grids and shut down the machine
        systemctl poweroff
        ;;
esac
