#!/usr/bin/env bash

# Ref: https://github.com/sandeel/i3-new-workspace

CURRENT_WORKSPACES=$(i3-msg -t get_workspaces)

for i in {1..10} ; do
    if [[ $CURRENT_WORKSPACES != *"\"num\":$i"* ]] ; then
        i3-msg move container to workspace number $i
        i3-msg workspace number $i
        break
    fi
done
