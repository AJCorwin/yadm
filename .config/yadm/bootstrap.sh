#!/bin/bash

# Install Enough to run Ansible
set -e
cd $HOME
sudo apt -y update
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt -y update
sudo apt install ansible-core
sudo apt -y install yadm
mkdir $HOME/Github-Repos
mkdir $HOME/Code
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
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
chsh -s $(which zsh)
sudo apt update -y  && sudo apt upgrade -y

echo "\n\nChange your terminal font to hack\nPlease reboot your machine for terminal changes to take affect\n"
zsh
