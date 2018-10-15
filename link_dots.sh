#!/bin/bash
if [ -n "$HOME" ]; then
    echo "Using HOME=$HOME"
    dir="$HOME"
else
    echo "Could not find HOME. Please, set HOME and try again."
    exit 1
fi

# kudos to url: https://stackoverflow.com/a/246128/2377489
dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
echo "$dotfiles"
for dfile in .bashrc .vimrc .vundle_conf.vim .bash_aliases .profile .Xresources .tmux.conf; do
    ln -s "$dotfiles/$dfile" "$dir"
done
