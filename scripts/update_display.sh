#!/usr/bin/env bash

# CONFIGURATION
EXT_PLACEMENT="above"
LAPTOP_DISPLAY="eDP1"
CMD_POST_DISPLAY="i3-msg restart"

# Break on error
set -e

# DISCOVERY

## Find current primary
PRIMARY_DISPLAY="$(xrandr --query | sed -En 's/^([A-Za-z0-9\-]+) connected primary .*$/\1/p' | head -n 1 | tr -d '\n')"

# Find disconnected displays still active
GHOST_DISPLAYS="$(xrandr --query | sed -En 's/^((DP|HDMI)[0-9\-]+) disconnected [0-9]+x[0-9]+\+[0-9]+\+[0-9]+ \(.*\).*$/\1/p')"

UNCOFIGD_DISPLAYS="$(xrandr --query | sed -En 's/^((DP|HDMI)[0-9\-]+) connected \(.*\).*$/\1/p')"


# APPLY SETTINGS
RUN_POSTCMD=false

## Disconnect ghost displays
for d in "$GHOST_DISPLAYS"; do

	# Empty result
	[ -z "$d" ] && continue

	echo "Found ghost display: $d"

	# Turn off ghost display
	xrandr --output $d --off

	# Post display change command
	RUN_POSTCMD=true
done

## Add new displays
for d in "$UNCOFIGD_DISPLAYS"; do

	# Empty result
	[ -z "$d" ] && continue

	echo "Found new display: $d"

	# Configure new display
	xrandr --output $d --${EXT_PLACEMENT} ${LAPTOP_DISPLAY} --auto

	# Post display change command
	RUN_POSTCMD=true
done

## Laptop should always be primary
if [ "$PRIMARY_DISPLAY" != "$LAPTOP_DISPLAY" ]; then

	# Set laptop to primary
	xrandr --output $LAPTOP_DISPLAY --preferred --primary --auto

	# Post display change command
	RUN_POSTCMD=true
fi

## Post display change command
if "$RUN_POSTCMD"; then
	eval ${CMD_POST_DISPLAY}
fi
