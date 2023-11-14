#!/usr/bin/env bash

flock_path="${HOME}/.de/.autorandr_post.run"
exec 200>"$flock_path"
flock -n 200 || exit 1

i3-msg restart

~/.de/xkb/update.sh
