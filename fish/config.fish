# turn on vi keybindings
fish_vi_key_bindings

# load .fishrc if it exists
if test -e ~/.fishrc
	. ~/.fishrc
end

# Fix terminal colors
set -x TERM xterm-256color

# Start FZF keybindings
fzf_key_bindings

# set nvim as the default editor
set -x EDITOR nvim

# set the display variable for wsl2
switch (cat /proc/version)
case "*WSL2*"
	set -x HOST_IP (cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
	set -x DISPLAY "$HOST_IP:0"
end
