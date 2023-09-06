#! /usr/bin/env sh

if ps cax | grep alacritty &> /dev/null; then
    alacritty msg create-window "$@"
else
    alacritty "$@"
fi

