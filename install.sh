#!/bin/bash

echo "Refreshing gpg-keys"
#sudo gpg --refresh-keys

echo "Updating Repositories"
sudo pacman -Syu
echo ""

# Install polybar xclip 

sudo pacman -S polybar xclip

## Installing basic Linux Stuff
# bat, autojump,



## Get Awesome and termite config
echo "----------Getting Config files from github.com/smash8tap/dotfiles----------"
cd /tmp; git clone git@github.com:smash8tap/dotfiles.git
cp /tmp/dotfiles/.zshrc ~/
cp /tmp/dotfiles/.config/awesome ~/.config/awesome -r 
cp /tmp/dotfiles/.config/polybar ~/.config/polybar -r 
echo ""

# Getting tmux config
echo "----------Getting Tmux Config----------"
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
echo ""


