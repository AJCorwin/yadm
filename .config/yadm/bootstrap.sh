#!/bin/bash

set -e
sudo upt-get pdate
sudo apt-get upgrade
sudo apt-get install -y ansible dos2unix whois


CONFIG_DIR="$HOME/playbooks"
DOTFILES_DIR="$HOME/.config"
SSH_DIR="$HOME/.ssh"

if ! [ -x "$(command -v ansible)" ]; then
  sudo ansible --noconfirm
fi

if ! [ -x "$(command -v whois)" ]; then
  sudo whois --noconfirm
fi

# change to base requirements folder
cd "$HOME/playbooks"

# Update Galaxy
# ansible-galaxy install -r requirements.yml

ansible-playbook --diff --extra-vars "@$CONFIG_DIR/values.yaml" "$DOTFILES_DIR/main.yaml" "$@" --ask-become-pass

cd "$HOME"
yadm checkout "/home/dev"
. ~/.zshrc
exec zsh
