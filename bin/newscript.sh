#!/bin/bash
set -e
# chmod 7555 ./.dotfiles/bin/dotfiles
# sudo ./.dotfiles/bin/dotfiles

# Paths
CONFIG_DIR="$HOME/.config/dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"
SSH_DIR="$HOME/.ssh"


if ! [ -x "$(command -v ansible)" ]; then
	apt-get install ansible -y
fi

if ! [ -x "$(command -v git)" ]; then
	apt-get install git -y
fi
if ! [ -x "$(command -v whois)" ]; then
	apt-get install whois -y
fi

# Update Galaxy
ansible-galaxy install -r requirements.yml

# Run playbook
if [[ -f "$HOME/.config/dotfiles/vault-password.txt" ]]; then
  ansible-playbook --diff --extra-vars "@$HOME/.config/dotfiles/values.yaml" --vault-password-file "$HOME/.config/dotfiles/vault-password.txt" "$HOME/.dotfiles/main.yaml" "$@"
else
  ansible-playbook --diff --extra-vars "@$HOME/.config/dotfiles/values.yaml" "$HOME/.dotfiles/main.yaml" "$@"
fi


# Terminal installs playbook
# playbook for just python / DS

# check if running WSL, if so stop, if not continue

if grep -qi microsoft /proc/version; then
  echo ""
  exit 1
else
    echo "continues with the script to install programs for the OS"
fi

# playbook for programs

if grep -qi microsoft /proc/version; then
  echo "Ubuntu on Windows"
  echo "put the ansible run commands here for WSL"
else
  echo "native Linux"
    echo "put the ansible run commands here for native linus"
fi
