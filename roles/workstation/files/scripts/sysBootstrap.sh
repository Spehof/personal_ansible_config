#!/bin/bash

echo_with_prompt "I hope you're running this script as root!"

# Update apt
apt update -y


# Upgrade any preinstalled packages
apt upgrade -y


## Ensure apt is set up to work with https sources: 
sudo apt-get install -y apt-transport-https
## what is this?
sudo apt-get install -y ca-certificates
sudo apt-get install -y curl
sudo apt-get install -y gnupg-agent
sudo apt-get install -y software-properties-common

sudo apt install -y snapd


## pip3
sudo apt-get install -y python3-pip

## pigmentize
pip install Pygments

## sdk man
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

## doker
sudo apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $(whoami)
echo_with_prompt "Verifying docker installation using a hello world container..."
# Verify the installaiton
docker run hello-world

## tmux, tmuxinator
# tmux
sudo apt install -y tmux

## mosh
sudo apt-get install -y mosh

## mozila 
sudo apt install -y firefox

## telegram
sudo snap install telegram-desktop
## spotify

## dropbox

# Git, obviously
sudo apt install -y git

## vlc media pleer
sudo snap install vlc

## intelig-idea
sudo snap install intellij-idea-ultimate --classic

## pycharm
## CLI commands like:
##		rg, rename, jpegoptim, OptiPNG, jq, ffmpeg, tree, 
##      httpie, fortune, cowsay, lolcat - need ruby
##      DeepL Translator (yarn global add deepl-translator-cli) (deepl --version)
##      Vault - хранилище секретов (лог пас токенов и тд) для приложений поддерживающее провайдеры секретов обласные
sudo apt-get install -y rg

sudo apt-get install -y rename

sudo apt-get install -y jpegoptim

sudo apt-get install -y OptiPNG

sudo apt-get install -y jq

sudo apt-get install -y ffmpeg

# Show directory structure with excellent formatting
sudo apt-get install -y tree

# Make requests with awesome response formatting
sudo apt-get install -y httpie 

sudo apt-get install -y fortune

sudo apt-get install -y cowsay

## postman
sudo snap install -y postman

## npm
curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs

## yarn
npm install --global yarn

## sublime merge
## Add gpg  key to apt-key  
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
## Select the channel to use: 
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
## Upgrade loc. db and install
sudo apt-get update
sudo apt-get install sublime-merge
## Create symbol link to ~/bin dir
ln -s /opt/sublime_merge/sublime_merge ~/bin/smerge


## ZHS
sudo apt install -y zsh
echo_with_prompt "This script (intentionally) does not install the Oh-my-zsh framework. If you want it, install it manually!"
zsh --version
chsh -s $(which zsh)
echo $SHELL

## sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get install -y sublime-text


# Htop
sudo apt-get install -y htop

# Cleanup the cache (TODO: set up a cron to do this)
apt clean

## SEE

## sudo apt-get install wine

## wget http://app.prntscr.com/build/setup-lightshot.exe

## wine ./setup-lightshot.exe

## скрипты для сбора dotfiles от толика
##
##wfc
##tcsg
##
##
##
##
## 
##
##
##
##
##
##
##
