#! /usr/bin/env sh

if command -v nu >/dev/null 2>&1; then
    nu "$@"
elif command -v fish >/dev/null 2>&1; then
    fish "$@"
else
    bash "$@"
fi

