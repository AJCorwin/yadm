#!/bin/bash

# Install Enough to run Ansible
#set -e
cd $HOME

sudo apt -y update

# Check if nvim 0.9 is installed, if it is the wrong version. Uninstall nvim
has_nvim=$(command -v nvim >/dev/null)
nvim_version=$(nvim --version | head -1 | grep -o '[0-9]\.[0-9]')
if ! $has_nvim; then
  echo "Nvim is not installed"
elif [ $(echo $nvim_version >= 0.9 | bc -l) ]; then
     echo "Wrong version of Nvim is installed"
     sudo apt remove neovim -y
else
     echo "Nvim version 0.9 or greater is installed"
fi

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
  echo "It's installed already!"
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install node

curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh [--[yes-]install-dependencies ] | LV_BRANCH='release-1.2/neovim-0.8' bash

yadm checkout "/home/$USER"
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
chsh -s $(which zsh)
sudo apt update -y  && sudo apt upgrade -y

echo "\n\nChange your terminal font to hack\nPlease reboot your machine for terminal changes to take affect\n"
zsh
