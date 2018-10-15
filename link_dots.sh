#!/bin/bash
if [ -n "$HOME" ]; then
	echo "Using HOME=$HOME"
	dir="$HOME"
else
	echo "Could not find HOME. Please, set HOME and try again."
	exit 1
fi

# not a perfect way, but rather usable for now, for other ways check
# url: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
dotfiles="$(dirname $0)"
ln -s "$dotfiles/.bashrc" "$dir"
