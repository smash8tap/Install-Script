#!/bin/bash

echo "Refreshing gpg-keys"
sudo gpg --refresh-keys

echo "Updating Repositories"
sudo pacman -Syu
echo ""


# Install ohmyzsh
echo "----------Install Ohmyzsh with Powerlevel-10k----------"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting


# Install polybar xclip 

sudo pacman -S polybar xclip brave-bin
## Installing basic Linux Stuff
# bat, autojump,



## Get Awesome and termite config
echo "----------Getting Config files from github.com/smash8tap/dotfiles----------"
git clone git@github.com:smash8tap/dotfiles.git /tmp/dotfiles
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


## Hacking Tools

echo "------- Installing Hacking tools--------"
mkdir /tmp/strap
curl https://blackarch.org/strap.sh -o /tmp/strap/strap.sh
chmod +x /tmp/strap/strap.sh
/tmp/strap/strap.sh

echo "Bloack Arch Repos added"
