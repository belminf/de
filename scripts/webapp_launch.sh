#!/usr/bin/env bash

DESKTOP_FILE="$(grep -Rl "Name=$1" ~/.local/share/applications 2>/dev/null | head -n 1)"

if [ -z "$DESKTOP_FILE" ]; then
  echo "ERROR: No web application found"
  exit 1
fi

gtk-launch "$(basename "$DESKTOP_FILE")" ${@:2}
