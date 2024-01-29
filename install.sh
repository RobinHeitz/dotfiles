#!/bin/bash
# taken from bartekspitza

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

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
        if ask "${filename}?"; then
            echo "source $(realpath "$file")" >> "$SH"
        fi
    fi
done

# Ask if .ssh_aliases should be sourced
# if ask "Create .ssh_aliases to be sourced?"; then
#     if [ ! -e ~/.ssh_aliases ]; then
#         touch ~/.ssh_aliases
#     fi
#     echo 'source ~/.ssh_aliases' >> "$SH"
# fi

echo '# -------------- Robin:dotfiles install ---------------' >> $SH

#Tmux conf: Creates a soft link (ln -s) so that tmux can find the config under the desired path ~/.tmux.conf
if ask "Do you want to install .tmux.conf?"; then
    ln -s "$(realpath "tmux-conf/tmux.conf")" ~/.tmux.conf
fi

#p10k config: Creates a softlink to ~/.p10k.zsh
if ask "Do you want to install existing .p10k.zsh?"; then
    ln -s "$(realpath ".p10k.zsh")" ~/.p10k.zsh
fi


# # Vim conf
# if ask "Do you want to install .vimrc?"; then
#     ln -s "$(realpath ".vimrc")" ~/.vimrc
# fi
