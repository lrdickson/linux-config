link() {
	dest="$HOME/$2"
	if ! [ -e $dest ]
	then
		ln -s "$(pwd)/$1" $dest
	fi
}

# Link the tmux config file
link tmux.conf .tmux.conf

# Link nvim files
mkdir -p $HOME/.config/nvim/ftplugin $HOME/.config/nvim/autoload
for i in $(find vim -type f); do
	link $i ".config/n$i"
done

# Link .inputrc
link inputrc .inputrc
