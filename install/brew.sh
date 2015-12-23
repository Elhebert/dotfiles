#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# cli tools
brew install wget

# development tools
brew install git
brew install tmux
brew install zsh

if [[ $nvm -eq 1 ]] ; then
	brew install nvm
fi

exit 0