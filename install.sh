#!/bin/bash

echo "Installing dotfiles"

source variables.sh
source install/link.sh

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

echo "Installing node (from nvm)"
source install/nvm.sh

echo "installing npm global packages"
#source install/npm.sh

echo "Creating vim directories"
mkdir -p ~/.vim-tmp

echo "Creating workspace, app and bin directories"
mkdir -p $workspace_path $app_path $bin_path

if [[ $zsh -eq 1 ]]; then
	echo "Configuring zsh as default shell"
	chsh -s $(which zsh)
else
	cat <<END >>$HOME/.bashrc

		# my_config
		source .my_config
END
fi

echo "Done."
