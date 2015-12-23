#!/bin/bash

if test $(which atom) ; then
	echo "Atom installed. Importing config..."
	rm $HOME/.atom/config/config.cson
	ln -s $HOME/.dotfiles/editors/atom/config.cson.symlink $HOME/.atom/config/config.cson
else
	echo "Atom not installed"
fi


if test $(which code) ; then
	echo "Code installed. Importing config..."
	rm $HOME/.config/Code/User/settings.json
	ln -s $HOME/.dotfiles/editors/code/settings.symlink $HOME/.config/Code/User/settings.json
else
	echo "Code is not installed."
	echo "This might be an error, if Code is installed, try to `ln -s /path/to/vscode/Code /usr/local/bin/code`, then rerun the script"
fi

exit 0