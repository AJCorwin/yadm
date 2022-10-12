#!/bin/bash

set -e

CONFIG_DIR="$HOME/playbooks"
DOTFILES_DIR="$HOME/.config"
SSH_DIR="$HOME/.ssh"

if ! [ -x "$(command -v ansible)" ]; then
  sudo ansible --noconfirm
fi

if ! [ -x "$(command -v whois)" ]; then
  sudo whois --noconfirm
fi

yadm checkout "/home/dev"

# change to base requirements folder
cd "$HOME/playbooks"

# Update Galaxy
# ansible-galaxy install -r requirements.yml

ansible-playbook --diff --extra-vars "@$CONFIG_DIR/values.yaml" "$DOTFILES_DIR/main.yaml" "$@"
