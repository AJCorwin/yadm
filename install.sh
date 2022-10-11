#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt update && sudo apt upgrade

sudo apt install -y yadm dos2unix

yadm clone https://github.com/AJCorwin/yadm.git

(echo) | sudo add-apt-repository ppa:kelleyk/emacs

sudo apt update && sudo apt install -y build-essential procps curl file git powerline fonts-powerline neovim fd-find ripgrep shellcheck pandoc emacs28 zsh pip

(echo) | sh -d "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

pip3 install numpy pandas tensorflow torch lightgbm gleam shogun opencv-contrib-python scrapy keras scipy scikit-learn matplotlib ntik