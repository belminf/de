#!/usr/bin/env bash

entries="⏻   Shutdown\n⭮   Reboot"

selected=$(echo -e "$entries" | rofi -theme-str 'window { width: 250; height: 180; }' -dmenu | awk '{print tolower($2)}')

case $selected in
reboot)
  exec systemctl reboot
  ;;
shutdown)
  exec systemctl poweroff
  ;;
esac
