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

# fish
mkdir -p $HOME/.config/fish/conf.d/
mkdir -p $HOME/.config/fish/functions/
for i in $(find fish -type f); do
	link $i ".config/$i"
done

# gitconfig
link gitconfig .gitconfig

# gpg
mkdir -p $HOME/.gnupg/
link gpg-agent.conf .gnupg/gpg-agent.conf

# inputrc
link inputrc .inputrc

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

for i in $(find config -type d); do
	mkdir -p "$HOME/.$i"
done
for i in $(find config -type f); do
	link $i ".$i"
done
