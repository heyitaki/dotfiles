#!/usr/bin/env bash

# This script will restart tilt with the same flags as the last time it was run.
# TODO: handle restarting minikube too, maybe with a flag?

# Access `history` from script
HISTFILE=~/.bash_history
set -o history

# Get the last `tilt up` command and restart tilt
tilt_up=$( history | egrep "tilt up -- (--[a-z]+)+" | tail -n 1 | sed -E "s/.*(tilt up -- .*)/\1/" )
tilt_down=$( echo $tilt_up | sed -E "s/tilt up/tilt down/" )
eval $tilt_down
eval $tilt_up
