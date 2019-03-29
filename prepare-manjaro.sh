#! /bin/bash

# Ask for sudo password beforehand
sudo -v

# update closest pacman mirrors
sudo pacman-mirrors -f

# upgrade system packages
sudo pacman -Syu --noconfirm

# cd to /tmp to install new package manager (yay)
cd /tmp

# clone & cd & build: yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# install custom font
sudo yay -S aur/nerd-fonts-fira-code aur/ulauncher --noconfirm

# install prezto (zsh plugin manager)
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# set zsh as default shell
sudo chsh -s $(which zsh)

# SYMLINKS: (move to separate file)!
