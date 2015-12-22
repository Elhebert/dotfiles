#!/bin/bash

if [ -d $HOME/.atom ]; then
	echo "Atom installed. Importing config..."
	rm $HOME/.atom/config/config.cson
	ln -s $HOME/.dotfiles/editors/atom/config.cson.symlink $HOME/.atom/config/config.cson
fi

if [ -d $HOME/Library/Application\ Support/Code ]; then
	echo "Code installed. Importing config..."
	rm $HOME/Library/Application\ Support/Code/User/settings.json
	ln -s $HOME/.dotfiles/editors/code/settings.symlink $HOME/Library/Application\ Support/Code/User/settings.json
fi

