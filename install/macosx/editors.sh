#!/bin/bash

if test $(which atom) ; then
	echo "Atom installed. Importing config..."
	rm $HOME/.atom/config/config.cson
	ln -s $HOME/.dotfiles/editors/atom/config.cson.symlink $HOME/.atom/config/config.cson
fi

if test $(which code) ; then
	echo "Code installed. Importing config..."
	rm $HOME/Library/Application\ Support/Code/User/settings.json
	ln -s $HOME/.dotfiles/editors/code/settings.symlink $HOME/Library/Application\ Support/Code/User/settings.json

	cat <<END >>$HOME/.dotfiles/.my_config.symlink

		# Code
		code () {
			VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;
		}

END
fi

exit 0