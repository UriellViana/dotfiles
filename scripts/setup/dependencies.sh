#! /bin/bash

# upgrade system packages
sudo pacman -Syu --noconfirm

# cd to /tmp to install new package manager (yay)
cd /tmp

# remove yay dir in case it already ran
rm -rf yay

# clone & cd & build: yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# install custom font
sudo yay -S aur/nerd-fonts-fira-code community/stow --noconfirm

# remove prezto dir in case it already ran
rm -rf "${ZDOTDIR:-$HOME}/.zprezto"

# install prezto (zsh plugin manager)
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
