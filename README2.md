# Dotfiles - My setup inspired by [this video](https://www.youtube.com/watch?v=CF1tMjvHDRA&ab_channel=JoseanMartinez)

## Installation

There are several install/ setup scripts in ./install, ./install/mac and ./install/ubuntu.

Clone this repo & set env variable

    git clone --recurse-submodules git@github.com:RobinHeitz/dotfiles.git .dotfiles

    cd .dotfiles

    source ./dotfiles.sh

### Ubuntu

#### Color scheme setup:

    ./install/ubuntu/color_theme.sh

(Don't forget to run ‘source ./dotfiles.sh‘ again.)

To inspect the the config of the standard gnome terminal:

    dconf dump /org/gnome/terminal/legacy/profiles:/
    dconf dump /org/gnome/terminal/legacy/profiles:/ > myfile.dconf

(Use the second one to dump into a file)

#### Install & setup zsh including oh-my-zsh and plugins:

    ./install/ubuntu/zsh_ubuntu.sh

source .zshrc afterwards & powerlevel10k setup assistant should automatically start:

    source ~/.zshrc

If it does not, start the setup manual:

    p10k configure

#### Tmux

    ./install/ubuntu/tmux_ubuntu.sh

The prefix is set to CTRL-a.
Here are some shortcuts:

1. Install: prefix + I
1. Update: prefix + U
1. Remove all plugins: prefix + alt + u

#### Nvim

    ./install/ubuntu/nvim_ubuntu.sh

If nvim fails, try to remove the packages & config and do it again:

    rm ~/.local/share/nvim
    rm ~/.local/state/nvim
    rm $DOTFILES/nvim-conf/plugin/packer_compiled.lua

### Mac

#### Install & setup iTerm2, zsh and oh-my-zsh (+ plugins):

This will install zsh and iterm2 as emulator.

    ./install/ubuntu/zsh_ubuntu.sh

Close the terminal and open ‘iTerm2‘ instead.

    source ~/.zshrc

source .zshrc afterwards & powerlevel10k setup assistant should automatically start.

If it does not, start the setup manual:

    p10k configure

### Setup iTerm2 Color Theme

Didn't found a way to do this automatically.
Open iTerm2 settings -> Profiles -> Colors -> Color Preset (bottom right corner) -> Import -> coolnight.itermcolors

#### Tmux

    ./install/ubuntu/tmux_ubuntu.sh

The prefix is set to CTRL-a.
Here are some shortcuts:

1. Install: prefix + I
1. Update: prefix + U
1. Remove all plugins: prefix + alt + u

#### Nvim

    ./install/ubuntu/nvim_ubuntu.sh

If nvim fails, try to remove the packages & config and do it again:

    rm ~/.local/share/nvim
    rm ~/.local/state/nvim
    rm $DOTFILES/nvim-conf/plugin/packer_compiled.lua
