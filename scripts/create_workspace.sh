#!/usr/bin/env bash

HIGHEST_WORKSPACE=$(swaymsg -t get_workspaces -r | jq -r '.[] | .name' | sort -n | tail -n 1)
NEW_WORKSPACE=$((HIGHEST_WORKSPACE + 1))

swaymsg workspace number $NEW_WORKSPACE
