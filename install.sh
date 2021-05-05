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

## BlackArch-Fuzzers
echo "Installing Fuzzers"
echo ""
sudo pacman -S ffuf feroxbuster fuzzdb zaproxy  wfuzz  sqlmap sqlbrute metasploit burpsuite

## BlackArch-WebApp
echo "---------Installing WebApps--------"
echo ""
sudo pacman -S droopescan drupwn gittools joomlascan joomscan laudanum nikto tplmap  wordpress-exploit-framework wordpresscan wpscan 
sudo pacman -S autorecon awsbucketdump checksec cmsscan cmsscanner davtest davscan enum4linux-ng git-dumper nmap rustscan smbexec smbmap

## BlackArch-Windows
echo "---------Installing blackarch-windows---------"
echo ""
sudo pacman -S bloodhound bloodhound-python nishang  powersploit winexe windapsearch

## Black-ARch Disasseembler
echo "---------Installing BlackArch-Disassemblers-----------"
echo ""
sudo pacman -S radare2 
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

## BlackArch-Crackers
sudo pacman -S cewl crunch fcrackzip hashcat hydra jwt-cracker john johnny kerbrute 

## BlackArch Exploitation
sudo pacman -S beef evil-winrm exploit-db exploitdb 

## BlackArch Recon

sudo pacman -S theharvester subfinder snmpcheck sherlock traceroute dnswalk dnsrecon dbeaver
