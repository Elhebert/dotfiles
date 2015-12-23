#!/bin/bash

if ! test $(which atom) ; then
	echo "Installing Atom"

	wget https://github.com/atom/atom/releases/download/v1.3.2/atom-amd64.deb
	dpkg -i atom-amd64.deb
fi

echo "Atom installed. Importing config..."
rm $HOME/.atom/config/config.cson
ln -s $HOME/.dotfiles/editors/atom/config.cson.symlink $HOME/.atom/config/config.cson


if test $(which code) ; then
	echo "Code installed. Importing config..."
	rm $HOME/.config/Code/User/settings.json
	ln -s $HOME/.dotfiles/editors/code/settings.symlink $HOME/.config/Code/User/settings.json
else
	echo "Code is not installed."
	echo "This might be an error, if Code is installed, try to `ln -s /path/to/vscode/Code /usr/local/bin/code`, then rerun the script"
fi
