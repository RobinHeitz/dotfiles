#!/bin/bash

sudo apt update && sudo apt install -y tmux

echo "Your DOTFILES points to $DOTFILES"

tmux_file=~/.tmux.conf

# Remove .tmux.conf if exists
[ ! -e $tmux_file ] || rm $tmux_file

# Create a soft link to ~/.tmux.conf
ln -s $DOTFILES/tmux-conf/tmux.conf $tmux_file

# Install Plugins
~/.tmux/plugins/tpm/bin/install_plugins
