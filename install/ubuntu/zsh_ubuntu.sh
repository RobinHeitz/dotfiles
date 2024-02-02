#!/bin/bash

ZSHRC="${HOME}/.zshrc"

sudo apt update && sudo apt install zsh

# Install Oh-my-zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Oh my zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


echo '# -------------- ohmyzsh install---------------' >> $SH
echo "source $DOTFILES/shell/ohmyzsh.sh" >> $SH
echo '# -------------- ohmyzsh install---------------' >> $SH

# Configure powerlevel10k with 'p10k configure'
