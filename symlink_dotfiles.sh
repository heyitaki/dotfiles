#!/bin/bash

# Get absolute path to this directory: https://stackoverflow.com/a/4774063
DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Symlinks
ln -s $DIR_PATH/.gitconfig ~/.gitconfig
