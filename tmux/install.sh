#!/bin/bash

linkables=$( find -H "$HOME/.dotfiles/tmux" -maxdepth 1 -name '*.symlink' )
for file in $linkables ; do
	target="$HOME/.$( basename $file ".symlink" )"
	if [ -e $target ]; then
		echo "~${target#$HOME} already exists... Skipping."
	else
		echo "Creating symlink for $file"
		ln -s $file $target
	fi
done