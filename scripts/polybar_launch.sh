#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
for _ in {1..30}; do
  pgrep -u "$UID" -x polybar >/dev/null || break
  sleep 1
done
pgrep -u "$UID" -x polybar >/dev/null && exit 1

# Get monitor information
connected_monitors=($(xrandr --query | grep " connected" | cut -d" " -f1))
primary_monitor="$(xrandr --query | grep " connected primary" | cut -d" " -f1)"

# If no primary, default to first
if [ -z "$primary_monitor" ]; then
  primary_monitor=${connected_monitors[0]}
fi

# Loop through each monitor
for m in ${connected_monitors[@]}; do

  # Choose the bar
  [[ $m == "$primary_monitor" ]] && bar="primary" || bar="others"

  # Bring up the bar
  monitor="$m" polybar --reload $bar &

done
