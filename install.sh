#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

read -p "Create config files ? [Yn] " answer
if [ -z "$answer" ] || [ ${answer:0:1} -eq "Y" ] || [ ${answer:0:1} -eq "y" ] ; then
	source install/link.sh
fi

read -p "Install teamocil ? [Yn] " answer
if [ -z "$answer" ] || [ ${answer:0:1} -eq "Y" ] || [ ${answer:0:1} -eq "y" ] ; then
	source install/teamocil.sh
fi

if [ "$(uname)" == "Darwin" ]; then
	echo "Running on OSX"

	if [ ! -e "$HOME/.my_config" ] ; then
#		ln -s $HOME/.dotfiles/zsh/macosx/my_config.symlink $HOME/.my_config
	fi

	echo "Brewing all the things"
#	source install/macosx/brew.sh

	echo "Installing node (from nvm)"
#	source install/nvm.sh

	echo "Setting editors config"
#	source install/macosx/editors.sh
else
	echo "Running on Linux (Debian)"

	if [ ! -e "$HOME/.my_config" ] ; then
		ln -s $HOME/.dotfiles/zsh/debian/my_config.symlink $HOME/.my_config
	fi

	echo "Installing packages"
	source install/debian/apt.sh

	echo "Installing node (from nvm)"
	source install/debian/nvm.sh

	echo "Setting editor config"
	source install/debian/editor.sh
fi

echo "installing npm global packages"
#source install/npm.sh

echo "creating vim directories"
#mkdir -p ~/.vim-tmp

echo "Configuring zsh as default shell"
#chsh -s $(which zsh)

echo "Done."
