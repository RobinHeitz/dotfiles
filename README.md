# Dotfiles - My setup inspired by [this video](https://www.youtube.com/watch?v=CF1tMjvHDRA&ab_channel=JoseanMartinez)

## Installation

Clone this repo & set env variable

    git clone --recurse-submodules git@github.com:RobinHeitz/dotfiles.git .dotfiles

    cd .dotfiles

    export DOTFILES=$(pwd)

Now, all installation scripts are within /install, just execute them. For OS-specific setups, there are subfolders mac and ubuntu.







================================

This repo contains all my configs/ dotfiles for easy setup. There are some OS specific things mentioned below.
It includes

- zshrc setup
- tmux configuration

## Installation

### Mac

Clone this repo

    git clone --recurse-submodules git@github.com:RobinHeitz/dotfiles.git .dotfiles

Using iTerm2

    brew install --cask iterm2

Install Oh-My-Zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

PowerLevel10k (Theme)

    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

Set iterm color profile:
Open iTerm2 settings -> Profiles -> Colors -> Color Preset (bottom right corner) -> Import -> coolnight.itermcolors

Download zsh plugins

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

### Ubuntu

Maybe some differences, Use Wezterm instead of iterm2
Also, MesloGS NF Regular (font) needs to be installed manually.

#### Gnome Terminal

Dump current config

    dconf dump /org/gnome/terminal/legacy/profiles:/

Dump to file:

    dconf dump /org/gnome/terminal/legacy/profiles:/ > myfile.dconf

Load Theme 'Coolnight'

    dconf load /org/gnome/terminal/legacy/profiles:/ < coolnight.dconf

## Main Installation

Since we have all dependencies now, we need to run the install script once

    cd to .dofiles (cloned in first step)
    ./install.sh

This will add softlinks for some config files as well as adds source cmds to our scripts inside /shell to zshrc.

## Additional steps

### Tmux

To install 3rd party plugins, there are some shortcuts:

Install package with tpm:
prefix (ctrl a) + I

Update:
prefix + U

remove plugins
prefix + alt + u
