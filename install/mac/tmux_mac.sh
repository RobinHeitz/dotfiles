#!/bin/bash

# check $DOTFILES 
source shell/util.sh
check_dotfiles

brew install tmux 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Your DOTFILES points to $DOTFILES"

tmux_file=~/.tmux.conf

# Remove .tmux.conf if exists
[ ! -e $tmux_file ] || rm $tmux_file

# Create a soft link to ~/.tmux.conf
ln -s $DOTFILES/tmux-conf/tmux.conf $tmux_file 

# Install Plugins
~/.tmux/plugins/tpm/bin/install_plugins
