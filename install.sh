#!/bin/bash
# taken from bartekspitza

# Ask Y/n
function ask() {
    read -p "$1" resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

if ask "Are you using Mac (y/Y) or Ubuntu (n)?"; then
  # Mac installations
  OS="mac"


else
  # Ubuntu installations
  OS="ubuntu"
fi

if ask "Install all dependencies (git, package manager)? (Y/n)"; then

  if [ $OS == "mac" ]; then
    brew install iterm2
    brew install zsh
    brew install tmux
    brew install neovim

  else 
    sudo apt update && sudo apt install -y zsh tmux python3-dev python3-pip
    cd ~/ && mkdir Applications && cd Applications
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
  fi

  # Install Oh-my-zsh 
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

  # Oh my zsh plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

fi



# Check what shell is being used
SH="${HOME}/.bashrc"
ZSHRC="${HOME}/.zshrc"
if [ -f "$ZSHRC" ]; then
	SH="$ZSHRC"
fi

echo >> $SH
echo '# -------------- Robin:dotfiles install ---------------' >> $SH

# Ask which files should be sourced
echo "Do you want $SH to source: "
for file in shell/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if ask "${filename}? (Y/n)"; then
            echo "source $(realpath "$file")" >> "$SH"
        fi
    fi
done

echo '# -------------- Robin:dotfiles install ---------------' >> $SH



# ================================================
# ================== TMUX CONFIG =================
# ================================================
#Tmux conf: Creates a soft link (ln -s) so that tmux can find the config under the desired path ~/.tmux.conf
if ask "Do you want to install .tmux.conf? (Y/n)"; then
    ln -s "$(realpath "tmux-conf/tmux.conf")" ~/.tmux.conf
    ~/.tmux/plugins/tpm/bin/install_plugins
fi

#p10k config: Creates a softlink to ~/.p10k.zsh
if ask "Do you want to install existing .p10k.zsh? (Y/n)"; then
    ln -s "$(realpath ".p10k.zsh")" ~/.p10k.zsh
fi


# ================================================
# ============= NEOVIM CONFIG ====================
# ================================================
if ask "Do you want to install ~/.config/nvim?"; then
    ln -s "$(realpath "nvim-conf/")" ~/.config/nvim
fi
