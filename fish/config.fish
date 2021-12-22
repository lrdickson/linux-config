# turn on vi keybindings
fish_vi_key_bindings

# load .fishrc if it exists
if test -e ~/.fishrc
	. ~/.fishrc
end

# Fix terminal colors
set -x TERM xterm-256color
