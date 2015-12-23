#!/bin/bash

# cli tools
sudo apt-get install wget -y

# development tools
sudo apt-get install git -y
sudo apt-get install tmux -y
sudo apt-get install zsh -y

if [[ $nvm -eq 1 ]] ; then
	sudo apt-get install nvm -y
fi