#!/usr/bin/env bash

# Environment (assume $XUSER)
export HOME="$(eval echo ~${XUSER})"
export XAUTHORITY="${HOME}/.Xauthority"

# Get script base
SCRIPT_PATH="$(dirname "$0")"

# Update display via script
$SCRIPT_PATH/update_display

# Log
logger -t udev-monitor-script "updated display"
