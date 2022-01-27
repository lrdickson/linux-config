# turn on vi keybindings
fish_vi_key_bindings

# load .fishrc if it exists
if test -e ~/.fishrc
	. ~/.fishrc
end

# Fix terminal colors
set -x TERM xterm-256color

# Make NNN easier to read
set -x NNN_COLOR 6666

# Start FZF keybindings
fzf_key_bindings

# set the default editor
if type -q nvim
	set -x EDITOR nvim
else if type -q vim
	set -x EDITOR vim
end

# set the display variable for wsl2
switch (cat /proc/version)
case "*WSL2*"
	set -x HOST_IP (cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
	set -x DISPLAY "$HOST_IP:0"
end
