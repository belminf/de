#!/usr/bin/env bash

# Reset display
autorandr --change --force

# Display BG
xsetroot -solid "#000000"
feh --bg-scale "${HOME}/.wallpaper.png"

# Set compositor
compton -b --inactive-opacity 0.90
