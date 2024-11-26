# Dotfiles - My setup inspired by [this video](https://www.youtube.com/watch?v=CF1tMjvHDRA&ab_channel=JoseanMartinez)

This repo contains a step-by-step installation guide for setting up my system.

## SSH Keys

```
ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-add ~/.ssh/my_file
```

Clone repo

```
cd ~/.config
git clone git@github.com:RobinHeitz/dotfiles.git
```

## ZSH setup (might differ for Mac OS)

Install the fonts first located at ./fonts

Then, load  or dump terminal color scheme and activate the font.

```
dconf load /org/gnome/terminal/legacy/profiles:/ < ../../coolnight.dconf
dconf dump /org/gnome/terminal/legacy/profiles:/ > myfile.dconf
```

ZSH Installation

```
sudo apt update && sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Configure oh-my-zsh with `p10k configre`

Add these two lines to `~/.zshrc`:

```
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

## Nvim setup

Install dependencies

```
sudo apt install python3-pip python3-venv -y
```

Install Lazygit

```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
```

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin
```

Clone `nvim-conf` repo and auto-install nvim plugins (with lazy)

```
cd ~/.config && git clone git@github.com:RobinHeitz/nvim-conf.git nvim
nvim
```

Install rust, golang, nodejs:

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Restart shell after

# Golang
# Install latest version from website
cd ~/Downloads && sudo tar -C /usr/local -xzf go1.23.3.linux-amd64.tar.gz

# Node22
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.zshrc
nvm install 22
```

Append to .zshrc:

```
export PATH=$PATH:/usr/local/go/bin
```

## Tmux setup

```
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/.config && git clone git@github.com:RobinHeitz/tmux-conf.git tmux
```

Install plugins via tpm by either

```
# start tmux with 'tmux'
C-a C-I
# or execute script:
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
```
