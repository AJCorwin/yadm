#!/bin/bash

# Install Enough to run Ansible
set -e
cd $HOME
sudo apt -y update
sudo apt remove neovim -y

sudo apt-add-repository --yes ppa:ansible/ansible
sleep 5
sudo apt-add-repository --yes ppa:neovim-ppa/unstable
sleep 5
sudo apt-add-repository --yes ppa:kelleyk/emacs
sleep 5
sudo apt -y update
sudo apt install ansible-core
sudo apt -y install yadm
mkdir $HOME/Github-Repos
mkdir $HOME/Code
yadm clone https://github.com/AJCorwin/yadm.git -b main

CONFIG_DIR="$HOME/playbooks"
DOTFILES_DIR="$HOME/.config"
SSH_DIR="$HOME/.ssh"

#### Original Script Below ####
cd "$HOME/playbooks"
ansible-playbook --diff --extra-vars "@$CONFIG_DIR/values.yaml" "$DOTFILES_DIR/main.yaml" "$@" --ask-become-pass -vv
cd $HOME
yadm checkout "/home/$USER"

nvm install node
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y

#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
chsh -s $(which zsh)
sudo apt update -y  && sudo apt upgrade -y

echo "\n\nChange your terminal font to hack\nPlease reboot your machine for terminal changes to take affect\n"
zsh
