#!/usr/bin/env bash

pkill swayidle
swayidle -w \
  timeout 120 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"'
