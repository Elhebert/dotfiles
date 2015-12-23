#!/bin/bash

if ! test $(which atom) ; then
	echo "Atom is not installed"
	read -n 1 -p "Do you wish to install it [Yn] ?" atom
	if [ -z "$atom" ] || [ $atom="y" ] || [ $atom="Y" ] ; then
		wget https://github.com/atom/atom/releases/download/v1.3.2/atom-amd64.deb
		dpkg -i atom-amd64.deb
	fi
fi

if test $(which atom) ; then
	echo "Atom installed. Importing config..."
	rm $HOME/.atom/config/config.cson
	ln -s $HOME/.dotfiles/editors/atom/config.cson.symlink $HOME/.atom/config/config.cson
fi

if test $(which code) ; then
	echo "Code installed. Importing config..."
	rm $HOME/.config/Code/User/settings.json
	ln -s $HOME/.dotfiles/editors/code/settings.symlink $HOME/.config/Code/User/settings.json
else
	echo "Code is not installed"
fi
