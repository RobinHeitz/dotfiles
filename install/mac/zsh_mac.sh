#!/bin/bash

ZSHRC="${HOME}/.zshrc"

# check $DOTFILES 
source shell/util.sh
check_dotfiles

brew install zsh
brew install iterm2

# Install Oh-my-zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh my zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Powerlevel 10k 
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo '# -------------- ohmyzsh install---------------' >> $SH
echo "source $DOTFILES/shell/ohmyzsh.sh" >> $SH
echo '# -------------- ohmyzsh install---------------' >> $SH

# Configure powerlevel10k with 'p10k configure'
