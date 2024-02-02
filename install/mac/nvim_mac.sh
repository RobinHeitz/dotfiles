#!/bin/bash

echo "Your DOTFILES points to $DOTFILES"

# Install neovim
brew install neovim

# Setup neovim

nvim_conf_dir=~/.config/nvim

# Remove .tmux.conf if exists
[ ! -e $nvim_conf_dir] || rm -r $nvim_conf_dir

# Create a soft link to ~/.tmux.conf
ln -s $DOTFILES/nvim-conf/ $nvim_conf_dir

