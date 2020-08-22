#!/usr/bin/bash

# Get current window ID
#eval "$(xdotool getwindowfocus getwindowgeometry --shell)"

#CURRENT_WIN=$(xdotool getactivewindow)

## Get geometry details
##
## Example output:
##
## WINDOW=37748739
## X=978
## Y=18
## WIDTH=942
## HEIGHT=1062
## SCREEN=0
#eval $(xdotool getwindowgeometry --shell $CURRENT_WIN)

## Get middle offsets
#MID_WIDTH=$(expr $WIDTH / 2)
#MID_HEIGHT=$(expr $HEIGHT / 2)

## Move the cursor
#xdotool mousemove -w $CURRENT_WIN $MID_WIDTH $MID_HEIGHT

eval "$(xdotool getwindowfocus getwindowgeometry --shell)"
xdotool mousemove "$((X + WIDTH / 2))" "$((Y + HEIGHT / 2))"
