#!/usr/bin/env bash

grep -qxF "$HOME/scripts" ~/.bashrc || echo "export PATH=\$PATH:$HOME/scripts" >> ~/.bashrc
source ~/.bashrc
