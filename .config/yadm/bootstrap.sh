#!/bin/bash

# Install Enough to run Ansible
#set -e
cd $HOME

sudo apt -y update

ansible_ppa=ansible/ansible
if ! grep -q "^deb .*$ansible_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    sudo apt-add-repository --yes ppa:ansible/ansible
    sleep 5
    sudo apt install -y ansible-core
fi
sleep 5

YADM_PKG="yadm"
PKG_OK=$(dpkg-query -W --showformat='${Status}' $YADM_PKG)
echo "Checking for $YADM_PKG: $PKG_OK"
if [ "" = "$PKG_OK" ]; then
  echo "No $YADM_PKG. Setting up $YADM_PKG."
  sudo apt-get --yes install $YADM_PKG
else
  echo "YADM is installed already"
fi

sleep 5

sudo apt update -y

if [ ! -d $HOME/Github-Repos ]; then
  mkdir -p $HOME/Github-Repos;
fi

if [ ! -d $HOME/Code ]; then
  mkdir -p $HOME/Code;
fi

yadm_repo=$HOME/.local/share/yadm/repo.git
if [ -e "$yadm_repo" ]; then
        echo "$yadm_repo exists, will pull latest version"
        yadm pull --force
else
        echo "$yadm_repo does not exist. Will pull it from github"
        yadm clone https://github.com/AJCorwin/yadm.git -b main
fi

CONFIG_DIR="$HOME/playbooks"
DOTFILES_DIR="$HOME/.config"
SSH_DIR="$HOME/.ssh"

#### Original Script Below ####
cd "$HOME/playbooks"
ansible-playbook --diff --extra-vars "@$CONFIG_DIR/values.yaml" "$DOTFILES_DIR/main.yaml" "$@" --ask-become-pass -vv
cd $HOME
#yadm checkout "/home/$USER"

# set up ssh key
if [ ! -f "$SSH_DIR/id_rsa" ]; then
    read -p 'git global username: ' git_user_name
    git_user_email="$git_user_name""@users.noreply.github.com"

    mkdir -p -m 700 "$SSH_DIR"
    ssh-keygen -b 4096 -t rsa -f "$SSH_DIR/id_rsa" -N "" -C "$git_user_email"
    ssh-add ~/.ssh/id_rsa
    git config --global user.name "$git_user_name"
    git config --global user.email "$git_user_email"

    batcat "$SSH_DIR/id_rsa.pub"
fi

yadm checkout "/home/$USER"
chsh -s $(which zsh)

sleep 5
echo "\n\nChange your terminal font to hack\nPlease reboot your machine for terminal changes to take affect\n"
zsh
