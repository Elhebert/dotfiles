#!/bin/bash

if test ! $(which teamocil) ; then
	echo "Installing teamocil"
	gem install teamocil
fi

if [ ! -d $HOME/.teamocil ] ; then
	mkdir ~/.teamocil
fi

configs=$( find -H "$HOME/.dotfiles/teamocil" -type f )
for config in $configs ; do
	target="$HOME/.teamocil/$(basename $config)"
	if [ ! -e $config ] ; then
		ln -s $config $target
	fi
done
