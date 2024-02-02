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
dconf load /org/gnome/terminal/legacy/profiles:/ < coolnight.dconf

# extract
nvim_dir=nvim_app
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
mv squashfs-root $nvim_dir 

# exposing nvim globally.
sudo mv $nvim_dir ~/Applications
sudo ln -s ~/Applications/$nvim_dir/AppRun /usr/bin/nvim

cd $DOTFILES

# Setup neovim
nvim_conf_dir=~/.config/nvim

# Remove .tmux.conf if exists
[ ! -e $nvim_conf_dir] || rm -r $nvim_conf_dir

# Create a soft link to ~/.tmux.conf
ln -s $DOTFILES/nvim-conf/ $nvim_conf_dir

