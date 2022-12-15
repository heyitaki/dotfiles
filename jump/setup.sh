#!/usr/bin/env bash

# Create `$HOME/scripts` if it does not already exist
mkdir -p $HOME/scripts

# Add `$HOME/scripts` to $PATH if it has not already been added
grep -q "$HOME/scripts" ~/.bashrc || echo "export PATH=\$PATH:$HOME/scripts" >> ~/.bashrc
source ~/.bashrc

# Get absolute path to this directory: https://stackoverflow.com/a/4774063
DIR_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Symlinks
for FILE_PATH in $DIR_PATH/*.sh; do
  if [ $FILE_PATH == $DIR_PATH/setup.sh ]; then
    continue
  fi

  FILE=$(basename $FILE_PATH .sh)
  rm -f $HOME/scripts/$FILE
  ln -s $FILE_PATH $HOME/scripts/$FILE
  echo "Symlinked $FILE.sh to ~/scripts/$FILE"
done
