#!/bin/bash

function check_dotfiles() {
  if [ -z "$DOTFILES" ]; then
    echo "DOTFILES is not set. Use 'source ./dotfiles.sh' to set it automatically."
    echo "Exit without installing."
    exit 1
  fi
}
