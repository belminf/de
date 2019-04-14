#!/usr/bin/env bash

# Environment (assume $XUSER)
export HOME="$(eval echo ~${XUSER})"
export XAUTHORITY="${HOME}/.Xauthority"

# Get script base
SCRIPT_PATH="$(dirname "$0")"

# Update display via script
sleep 1
$SCRIPT_PATH/update_display.sh

# Log
logger -t udev-monitor-script "Updated display"
