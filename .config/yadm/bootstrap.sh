#!/bin/bash

set -e
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y ansible powerline whois pip fonts-hack-ttf dos2unix fonts-powerline vim
 

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
