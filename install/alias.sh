#!/bin/bash

# Check what shell is being used
SH="${HOME}/.bashrc"
ZSHRC="${HOME}/.zshrc"
if [ -f "$ZSHRC" ]; then
	SH="$ZSHRC"
fi

echo '# -------------- Robin:dotfiles install ---------------' >> $SH
echo "source $DOTFILES/shell/custom_alias.sh" >> $SH
echo '# -------------- Robin:dotfiles install ---------------' >> $SH
