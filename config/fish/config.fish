# load .fishrc if it exists
if test -e ~/.fishrc
	. ~/.fishrc
end

if status is-interactive
	# turn on vi keybindings
	fish_vi_key_bindings

	# Start FZF keybindings
	fzf_key_bindings

	# Carapace completions
	# carapace_exclusions=["git" "scp" "ssh"]
	# $carapace_script="(carapace _carapace)"
	# for e in $carapace_exclusions
	carapace _carapace | sed 's/.*\<git\>.*//' | sed 's/.*\<scp\>.*//' | source
end

# set the default editor
if type -q kak
	set -x EDITOR kak
else if type -q nvim
	set -x EDITOR nvim
else if type -q vim
	set -x EDITOR vim
else if type -q vi
	set -x EDITOR vi
end

# set the display variable for wsl2
switch (cat /proc/version)
case "*WSL2*"
	set -x HOST_IP (cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
	set -x DISPLAY "$HOST_IP:0"
end

# have tmux display 256color
alias tmux="tmux -2"

# Make NNN easier to read
set -x NNN_COLORS 6666

# Extra path
fish_add_path ~/go/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/node_modules/.bin
fish_add_path ~/.local/bin

