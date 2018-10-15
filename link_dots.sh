#!/bin/bash
if [ -n "$HOME" ]; then
    echo "Using HOME=$HOME"
else
    echo "Could not find HOME. Please, set HOME and try again."
    exit 1
fi

# kudos to url: https://stackoverflow.com/a/246128/2377489
dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

for dfile in .bashrc .vimrc .vundle_conf.vim .bash_aliases .profile .Xresources .tmux.conf; do
    echo "Trying to create a link for $dfile:"
    ln -s "$dotfiles/$dfile" "$HOME"
    if [ $? -eq "0" ]; then
        echo "OK"
    else
        echo "ERROR"
    fi
    echo
done

echo "Trying to create a link for rc.lua:"
AWESOMEWM_DIR="$HOME/.config/awesome/"
if [ ! -d "$AWESOMEWM_DIR" ]; then
    echo "$AWESOMEWM_DIR does not exist. Creating it now.."
    mkdir -p "$AWESOMEWM_DIR"
fi
ln -s "$dotfiles/rc.lua" "$AWESOMEWM_DIR"
if [ $? -eq "0" ]; then
    echo "OK"
else
    echo "ERROR"
fi
