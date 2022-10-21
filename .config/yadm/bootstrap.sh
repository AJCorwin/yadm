#!/bin/bash

# Install Enough to run Ansible
set -e
sudo apt update && sudo apt -y install ansible-core
sudo add-apt-repository ppa:kelleyk/emacs --yes

CONFIG_DIR="$HOME/playbooks"
DOTFILES_DIR="$HOME/.config"
SSH_DIR="$HOME/.ssh"


#### Original Script Below ####
cd "$HOME/playbooks"
ansible-playbook --diff --extra-vars "@$CONFIG_DIR/values.yaml" "$DOTFILES_DIR/main.yaml" "$@" --ask-become-pass
cd $HOME
yadm checkout "/home/dev"
source ~/.zshrc
