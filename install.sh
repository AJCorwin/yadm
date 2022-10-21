#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt-get install yadm && dos2unix
yadm clone https://github.com/AJCorwin/yadm.git
find .config/ .zshrc .bashrc -type f -print0 | xargs -0 dos2unix
sudo add-apt-repository ppa:kelleyk/emacs  -y 
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install build-essential dos2unix yadm  procps curl file git powerline fonts-powerline neovim fd-find ripgrep shellcheck pandoc emacs28 zsh pip -y
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d -y
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync
~/.emacs.d/bin/doom doctor -y
pip3 install numpy pandas tensorflow torch lightgbm gleam shogun opencv-contrib-python scrapy keras scipy scikit-learn matplotlib nltk -y
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
 cd $HOME

sudo rm nerd-fonts/ -r
source .zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  -y
