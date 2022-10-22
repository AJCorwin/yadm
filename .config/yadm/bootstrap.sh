#!/bin/bash

# Install Enough to run Ansible
set -e
sudo apt -y update
sudo apt install ansible
sudo apt -y install yadm
yadm clone https://github.com/AJCorwin/yadm.git -b main
sudo add-apt-repository --yes ppa:kelleyk/emacs

CONFIG_DIR="$HOME/playbooks"
DOTFILES_DIR="$HOME/.config"
SSH_DIR="$HOME/.ssh"

#### Original Script Below ####
cd "$HOME/playbooks"
ansible-playbook --diff --extra-vars "@$CONFIG_DIR/values.yaml" "$DOTFILES_DIR/main.yaml" "$@" --ask-become-pass -vv
cd $HOME
yadm checkout "/home/$USER"
chsh -s $(which zsh)
zsh
sudo apt update -y  && sudo apt upgrade -y

echo "\n\nChange your terminal font to hack\nPlease reboot your machine for terminal changes to take affect\n"
