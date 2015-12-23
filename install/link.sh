#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlinks"

linkables=$( find -H "$DOTFILES" -mindepth 2 -maxdepth 2 -name '*.symlink' )
for file in $linkables ; do
	target="$HOME/.$( basename $file ".symlink" )"
	if [ -e $target ]; then
		echo "~${target#$HOME} already exists... Skipping."
	else
		echo "Creating symlink for $file"
		ln -s $file $target
	fi
done

if [[ $teamocil -eq 1 ]]; then
	source $DOTFILES/tmux/teamocil/install.sh
fi
