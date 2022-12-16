#!/usr/bin/env bash

# Parse short/long flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    -m|--minikube)
      MINIKUBE=true
      shift
      ;;
    -h|--help)
cat << EOF
Restart Tilt with the same flags as the last time it was run.
Usage: restart_tilt [options]

Options:
  -m, --minikube  Restart minikube before restarting tilt
  -h, --help      Show this help message
EOF
      exit 0
      ;;
    *)
      echo "Unknown flag: $1"
      exit 1
      ;;
  esac
done

# Access `history` from script
HISTFILE=~/.bash_history
set -o history

# Get the last `tilt up` command and restart tilt
tilt_up=$( history | egrep "tilt up -- (--[a-z]+)+" | tail -n 1 | sed -E "s/.*(tilt up -- .*)/\1/" )
tilt_down=$( echo $tilt_up | sed -E "s/tilt up/tilt down/" )
eval $tilt_down

if [ "$MINIKUBE" = true ]; then
  minikube delete
  minikube start --driver=docker --kubernetes-version=v1.22.3 --cpus=$(nproc) --memory=50G --disk-size=120g --namespace=wormhole
fi

eval $tilt_up
