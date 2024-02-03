#!/bin/bash

# check $DOTFILES 
source shell/util.sh
check_dotfiles

# Install neovim
brew install neovim

# Setup neovim

nvim_conf_dir=~/.config/nvim

# Remove nvim (conf) if exists
[ ! -e $nvim_conf_dir] || rm -r $nvim_conf_dir

# Create a soft link from nvim-conf to ~/.config/nvim
ln -s $DOTFILES/nvim-conf/ $nvim_conf_dir

