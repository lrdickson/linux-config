#! /usr/bin/env bash

link() {
	dest="$HOME/$2"
	if ! [ -e $dest ]
	then
		ln -s "$(pwd)/$1" $dest
	fi
}

# Links to perform when not using nixos
if ! cat /proc/version | grep -q "NixOS" ; then
	# tmux
	link tmux.conf .tmux.conf
fi

# nu
touch ~/.config/nushell/extra.nu
if which oh-my-posh > /dev/null 2>&1 ; then
    oh-my-posh init nu --config oh-my-posh.json
fi

# fish
if which carapace > /dev/null 2>&1 ; then
    mkdir -p ~/.config/fish/completions
    carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish # disable auto-loaded completions (#185)
    rm ~/.config/fish/completions/scp.fish
    rm ~/.config/fish/completions/ssh.fish
    rm ~/.config/fish/completions/git.fish
fi

# gpg
mkdir -p $HOME/.gnupg/
link gpg-agent.conf .gnupg/gpg-agent.conf

# ssh
mkdir -p $HOME/.ssh/
for i in $(find ssh -type f); do
	link $i ".$i"
done

# vim
mkdir -p $HOME/.vim/ftplugin $HOME/.config/nvim/ftplugin
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

# zoxide
# if which zoxide > /dev/null 2>&1 ; then
# 	zoxide init nushell > ~/.config/nushell/zoxide.nu
# fi

# link everything in the bin directory
mkdir -p ~/.local/bin
for i in $(find bin -type f); do
	chmod +x $i
	link $i ".local/$(echo $i | sed 's/\.sh//')"
done

# bash config
# bashsource="if [ -f $HOME/.config/bash/config.sh ]; then source $HOME/.config/bash/config.sh; fi"
# if ! grep -q "$bashsource" $HOME/.bashrc
# then
#     echo $bashsource >> $HOME/.bashrc
# fi
