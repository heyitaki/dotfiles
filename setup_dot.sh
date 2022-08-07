#!/usr/bin/env bash

# Create `$HOME/bin` if it does not already exist
mkdir -p $HOME/bin

# Add `$HOME/bin` to $PATH if it has not already been added: 
# https://unix.stackexchange.com/a/217626/153872
[[ ":$PATH:" != *":$HOME/bin"* ]] && PATH="$HOME/bin:${PATH}"

# Get absolute path to this directory: https://stackoverflow.com/a/4774063
DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Symlink `dot` to $HOME/bin
ln -s $DIR_PATH/dot $HOME/bin/dot
