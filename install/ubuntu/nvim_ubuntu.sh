#!/bin/bash

echo "Your DOTFILES points to $DOTFILES"

# Install neovim
cd ~
if [ ! -e Applications ]; then
  mkdir Applications
fi
cd Applications

# Download
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

# extract
nvim=nvim_app
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
mv squashfs-root $nvim 

# exposing nvim globally.
sudo ln -s ~/Applications/$nvim/AppRun /usr/bin/nvim
rm nvim.appimage

cd $DOTFILES

# Setup neovim
nvim_conf_dir=~/.config/nvim

# Remove .tmux.conf if exists
[ ! -e $nvim_conf_dir ] || rm -r $nvim_conf_dir

# Create a soft link to ~/.tmux.conf
ln -s $DOTFILES/nvim-conf/ $nvim_conf_dir

