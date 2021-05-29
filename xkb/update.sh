#!/bin/env bash

TYPES_FILE="/usr/share/X11/xkb/types/complete"
TYPES_LINE='    include "win_remap"'

RULES_FILE="/usr/share/X11/xkb/rules/evdev"
RULES_MATCH="  shift:rshift_both_capslock_cancel "
RULES_LINE="  win_remap:super                    =       +win_remap(super)" 


grep -q "$TYPES_LINE"  "$TYPES_FILE" || \
  sudo sed -i "\$i\\${TYPES_LINE}" "$TYPES_FILE"

grep -q 'win_remap' "$RULES_FILE" || \
  sudo sed -i "/^${RULES_MATCH}/a \\${RULES_LINE}" "$RULES_FILE"

xkbcomp map "$DISPLAY" >/dev/null 2>&1
