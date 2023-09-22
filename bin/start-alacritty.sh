#! /usr/bin/env sh

if ps cax | grep -q alacritty; then
    alacritty msg create-window --working-directory $HOME "$@"
else
    alacritty "$@"
fi

