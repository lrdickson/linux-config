#! /usr/bin/env sh

if ps cax | grep -q alacritty; then
    alacritty msg create-window "$@"
else
    alacritty "$@"
fi

