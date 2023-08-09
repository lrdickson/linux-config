#! /usr/bin/env bash

link() {
	dest="$HOME/$2"
	if ! [ -e $dest ]
	then
		ln -s "$(pwd)/$1" $dest
	fi
}

# Links to perform when not using nixos
if [[ $(cat /proc/version) != *"NixOS"* ]]; then
	# tmux
	link tmux.conf .tmux.conf
fi

# gitconfig
link gitconfig .gitconfig

# nu
link ./oh-my-posh.nu .oh-my-posh.nu
touch ~/.config/nushell/extra.nu

# gpg
mkdir -p $HOME/.gnupg/
link gpg-agent.conf .gnupg/gpg-agent.conf

# ssh
mkdir -p $HOME/.ssh/
for i in $(find ssh -type f); do
	link $i ".$i"
done

# vim
mkdir -p $HOME/.vim/ftplugin $HOME/.vim/autoload
mkdir -p $HOME/.config/nvim/ftplugin $HOME/.config/nvim/autoload
link vim/init.vim .vimrc
for i in $(find vim -type f); do
	link $i ".$i"
	link $i ".config/n$i"
done

# Link everything in the config directory
for i in $(find config -type d); do
	mkdir -p "$HOME/.$i"
done
for i in $(find config -type f); do
	link $i ".$i"
done

# bash config
# bashsource="if [ -f $HOME/.config/bash/config.sh ]; then source $HOME/.config/bash/config.sh; fi"
# if ! grep -q "$bashsource" $HOME/.bashrc
# then
#     echo $bashsource >> $HOME/.bashrc
# fi
