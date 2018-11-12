#!/usr/bin/env bash

# CONFIGURATION
EXT_PLACEMENT="above"
LAPTOP_DISPLAY="eDP1"
CMD_POST_DISPLAY="feh --bg-scale ${HOME}/.wallpaper.png"

# Break on error
set -e

# DISCOVERY

# Find connected DP display
EXT_DISPLAY="$(xrandr --query | sed -En 's/^((DP|HDMI)[0-9\-]+) connected.*/\1/p' | head -n 1 | tr -d '\n')"

# Find current primary
PRIMARY_DISPLAY="$(xrandr --query | sed -En 's/^([A-Za-z0-9\-]+) connected primary .*$/\1/p' | head -n 1 | tr -d '\n')"

# Count how many unadjusted monitors they are
UNADJ_DISPLAYS="$(xrandr --query | grep '+0+0' | wc -l)"


# APPLY SETTINGS

if [ -n "$EXT_DISPLAY" ] && [ "$UNADJ_DISPLAYS" -gt "1" ] 2> /dev/null
then

    echo $EXT_DISPLAY

  # Setup external display
  xrandr --output $EXT_DISPLAY --preferred --${EXT_PLACEMENT} ${LAPTOP_DISPLAY} --auto

  # Set background image
  eval ${CMD_POST_DISPLAY}

fi

# Laptop should always be primary
if [ "$PRIMARY_DISPLAY" != "$LAPTOP_DISPLAY" ]
then

  # Set laptop to primary
  xrandr --output $LAPTOP_DISPLAY --preferred --primary --auto

  # Set background image
  eval ${CMD_POST_DISPLAY}

fi
