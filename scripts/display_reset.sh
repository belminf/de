#!/usr/bin/env bash

# Reset display
autorandr --change --force

# Display BG
xsetroot -solid "#000000"
feh --bg-scale "${HOME}/.wallpaper.png"

# Set compositor
picom -b -i 0.90
