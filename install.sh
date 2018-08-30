#!/bin/bash

# Brew
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew tap homebrew/bundle
brew bundle

# Change default shell
chsh -s $(which zsh)

# Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
/usr/local/bin/composer global require laravel/installer

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ./zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ./zsh/plugins/zsh-autosuggestions

# Config file
# Remove files if exists and symlinks from .dotfiles
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

rm $HOME/.vimrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc

rm $HOME/.nvmrc
ln -s $HOME/.dotfiles/.nvmrc $HOME/.nvmrc

rm $HOME/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

rm $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install
npm install -g npm @vue/cli caniuse-cmd

# MacOs preferences
source .macos
