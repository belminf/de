#!/usr/bin/env bash

sleep 5
xrandr --output DP1 --off
sleep 2
xrandr --output DP1 --auto
sleep 2
i3-msg restart
sleep 2
i3-msg restart
