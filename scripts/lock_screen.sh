#!/usr/bin/env bash
import -window root jpg:- | convert -scale 4% -scale 2500% jpg:- /tmp/lock-screen-bg.jpg
i3lock -i /tmp/lock-screen-bg.jpg
rm /tmp/lock-screen-bg.jpg
