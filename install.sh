#!/bin/bash

name () {
	echo "\033[1;36m ${1} \033[0m"
}

task () {
	echo "\033[0;34m ${*}\033[0m"
	$* || {
		echo "\033[0;31m Failed " 1>&2 ;
		exit 1 ;
	}
}

name "=== FILE STRUCTURE ==="

name "Create app directory"
task mkdir ~/app

name "Create wrokspace directory"

task mkdir ~/workspace
name "=== PACKAGES ==="

name "Install htop"
task sudo apt-get install -y htop

name "Install git"
task sudo apt-get install -y git

name "Install curl"
task sudo apt-get install -y curl

name "Install wget"
task sudo apt-get install -y wget

name "Install zsh"
task sudo apt-get install -y zsh

name "Install oh-my-zsh"
task sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

name "Install nvm"
task curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | NVM_DIR=~/app/nvm bash

name "Install tmux (2.1)"
task cd ~/Downloads
task wget https://github.com/tmux/tmux/releases/download/2.1/tmux-2.1.tar.gz
task tar xf tmux-2.1.tar.gz
task cd tmux-2.1
task ./configure
task make
task sudo make install
task cd ..
task rm -rf tmux-2.1.tar.gz tmux-2.1

name "Install vim"
task sudo apt-get install -y libncurses5-dev libgtk2.0-dev \
		libatk1.0-dev  libbonoboui2-dev libcairo2-dev \
		libx11-dev libxpm-dev libxt-dev python-dev
task cd ~/Downloads
task git clone https://github.com/vim/vim.git
task cd vim
task ./configure \
		--with-features=huge \
		--enable-pythoninterp \
		--with-python-config-dir=/usr/lib/python2.7/config \
		--enable-python3interp \
		--with-python3-config-dir=/usr/lib/python3.4/config
task make
task sudo make install
task cd ..
task rm -rf vim

name "Install redshift"
task sudo apt-get install build-essential libxcb-randr0-dev
task ./bootstrap
task ./configure --enable-randr --prefix=$HOME/app/redshift/root \
   --with-systemduserunitdir=$HOME/.config/systemd/user
task make
task sudo make install

name "Install Atom"
task cd ~/Downloads
task wget https://atom.io/download/deb
task sudo dpkg -i atom-amd64.deb
task rm atom-amd64.deb

name "Install Chrome"
task cd ~/Downloads
task sudo apt-get install -y libxss1 libappindicator1 libindicator7
task wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
task sudo dpkg -i google-chrome*.deb
task rm google-chrome*.deb

name "=== dotFILES ==="

name "Remove default configuration files"
if [ -f "~/.tmux.conf" ]; then
    task rm ~/.tmux.conf
fi
if [ -f "~/.vimrc" ]; then
    task rm ~/.vimrc
fi
if [ -f "~/.zshrc" ]; then
    task rm ~/.zshrc
fi
if [ -f "~/.config/redshift.conf" ]; then
    task rm ~/.config/redshift.conf
fi
if [ -f "~/.atom/config.cson" ]; then
    task rm ~/.atom/config.cson
fi

name "Create symlinks"
task ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
task ln -s ~/.dotfiles/.vimrc ~/.vimrc
task ln -s ~/.dotfiles/.zshrc ~/.zshrc
task ln -s ~/.dotfiles/redshift.conf ~/.config/redshift.conf
task ln -s ~/.dotfiles/atom/config.cson ~/.atom/config.cson

name "=== CONFIGURATION ==="

name "Set zsh as default shell"
task chsh -s $(which zsh)

name "Set terminal theme"
task dconf load /org/gnome/terminal/legacy/profiles:/:042ded31-cffe-4494-a3f3-c6004aec3dac/ < terminal
