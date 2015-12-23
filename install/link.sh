#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlinks"

if [[ $tmux -eq 1 ]]; then
	source $DOTFILES/tmux/install.sh
fi

if [[ $teamocil -eq 1 ]]; then
	source $DOTFILES/teamocil/install.sh
fi

if [[ $zsh -eq 1 ]]; then
	source $DOTFILES/zsh/install.sh
fi

if [[ $vim -eq 1 ]]; then
	source $DOTFILES/vim/install.sh
fi

# linkables=$( find -H "$DOTFILES" -maxdepth 2 -name '*.symlink' )
# for file in $linkables ; do
#     target="$HOME/.$( basename $file ".symlink" )"
#     if [ -e $target ]; then
#         echo "~${target#$HOME} already exists... Skipping."
#     else
#         echo "Creating symlink for $file"
#         ln -s $file $target
#     fi
# done
