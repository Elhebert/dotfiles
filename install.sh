#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh
source install/teamocil.sh

if [ "$(uname)" == "Darwin" ]; then
	echo "Running on OSX"

	echo "Brewing all the things"
	source install/brew.sh

	echo "Installing node (from nvm)"
	source install/nvm.sh

	echo "Settings editors config"
	source install/editors.sh
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."
