#!/bin/bash

if test $(which atom) ; then
	echo "Atom installed. Importing config..."
	rm $HOME/.atom/config.cson
	ln -s $HOME/.dotfiles/editors/atom/config.cson.symlink $HOME/.atom/config.cson
fi

if test $(which code) ; then
	echo "Code installed. Importing config..."
	rm $HOME/Library/Application\ Support/Code/User/settings.json
	ln -s $HOME/.dotfiles/editors/code/settings.symlink $HOME/Library/Application\ Support/Code/User/settings.json
fi
