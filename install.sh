#!/bin/bash

echo "Refreshing pacman-keys"
sudo pacman-key --refresh-key

echo "Updating Repositories"
sudo pacman -Syu
echo ""

## installing font
echo "[+] Installing Fonts" 
mkdir /tmp/fonts

curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o /tmp/fonts/font1.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o /tmp/fonts/font2.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o /tmp/fonts/font3.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o /tmp/fonts/font4.ttf
font-manager -i /tmp/fonts/*


# Install ohmyzsh
echo "----------Install Ohmyzsh with Powerlevel-10k----------"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting


# Install polybar xclip 
# Installing basic Linux Stuff
# bat, autojump,

sudo pacman -S polybar xclip brave-bin bat fzf




## Get Awesome and termite config
echo "----------Getting Config files from github.com/smash8tap/dotfiles----------"
git clone https://github.com/smash8tap/dotfiles.git /tmp/dotfiles
mv ~/.zshrc ~/.zshrc.bak
cp /tmp/dotfiles/.zshrc ~/

mv ~/.config/awesome ~/.config/awesome.bak
cp /tmp/dotfiles/.config/awesome ~/.config/awesome -r 
mv ~/.config/polybar ~/.config/polybar.bak 
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
