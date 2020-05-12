#!/usr/bin/env bash

flock_path="/var/run/autorandr_post"
exec 200>$flock_path
flock -n 200 || exit 1

i3-msg restart
