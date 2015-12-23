#!/bin/bash

if test ! $(which teamocil) ; then
	echo "Installing teamocil"
	gem install teamocil
fi

if [ ! -d $HOME/.teamocil ] ; then
	mkdir ~/.teamocil
fi

linkables=$( find -H "$HOME/.dotfiles/tmux/teamocil" -maxdepth 1 -name '*.symlink' )
for file in $linkables ; do
	target="$HOME/.teamocil/$( basename $file ".symlink" )"
	if [ -e $target ]; then
		echo "~${target#$HOME} already exists... Skipping."
	else
		echo "Creating symlink for $file"
		ln -s $file $target
	fi
done
