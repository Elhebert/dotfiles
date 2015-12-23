#!/bin/bash

echo "Installing dotfiles"

source variables.sh

if [ "$(uname)" == "Darwin" ]; then
	echo "Running on OSX"

	echo "Brewing all the things"
	source install/brew.sh

	echo "Setting editors config"
	source install/macosx/editors.sh
else
 	echo "Running on Linux (Debian)"

	echo "Installing packages"
	source install/apt.sh

	echo "Setting editor config"
	source install/debian/editor.sh
fi

echo "Linking my config"
ln -s $HOME/.dotfiles/my_config.symlink $HOME/.my_config

if [[ $nvm -eq 1 ]] ; then
	echo "Installing node (from nvm)"
	source install/nvm.sh
fi

if [[ $npm -eq 1 ]] ; then
	echo "installing npm global packages"
	#source install/npm.sh
fi

echo "Creating vim directories"
mkdir -p ~/.vim-tmp

if [[ $zsh -eq 1 ]]; then
	echo "Configuring zsh as default shell"
	chsh -s $(which zsh)
else
	cat <<END >>$HOME/.bashrc

		# my_config
		source $HOME/.my_config
END
fi

echo "Done."
