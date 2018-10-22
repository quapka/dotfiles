#!/bin/bash
if [ -n "$HOME" ]; then
    echo "Using HOME=$HOME"
else
    echo "Could not find HOME. Please, set HOME and try again."
    exit 1
fi

# kudos to url: https://stackoverflow.com/a/246128/2377489
dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
LOCAL_BACKUP="./backup"
CONFIG_DIR="$HOME/.config"
HOME_DOTFILES=('.bashrc' '.vimrc' '.vundle_conf.vim' '.bash_aliases' '.profile' '.Xresources' '.tmux.conf')
zshFile=".zshrc"
if [[ $SHELL == */zsh ]]; then
    echo "ZSH usage detected. File $zshFile can be linked as well."
    HOME_DOTFILES+=("$zshFile")
else
    echo "Looks like ZSH is not used. Won't attempt to link $zshFile."
fi

for dfile in "${HOME_DOTFILES[@]}" ; do
    # TODO make this logic into a function, that just accepts some paths,
    # because it needs to be used for rc.lua as well.
    echo "Trying to create a link for $dfile:"

    force=""
    existing_dotfile="$HOME/$dfile"
    if [ -e "$existing_dotfile" ]; then
        echo "The file $existing_dotfile already exists."
        read -p "Would you like to overwrite it (it will be saved in $LOCAL_BACKUP) [y/n]?" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            force="--force"
            if [ ! -d "$LOCAL_BACKUP" ]; then
                mkdir "$LOCAL_BACKUP"
            fi
            echo "Copying $existing_dotfile to $LOCAL_BACKUP"
            cp "$existing_dotfile" "$LOCAL_BACKUP/$dfile.$( date +"%Y%m%d-%H%M-%S")"
        else
            echo "Skipping $existing_dotfile"
            continue
        fi
    fi
    echo "Creating the symlink $existing_dotfile"
    ln --symbolic "$force" "$dotfiles/$dfile" "$HOME"
    if [ $? -eq "0" ]; then
        echo "OK"
    else
        echo "ERROR"
    fi
    echo
done



echo "Trying to create a link for rc.lua:"
AWESOMEWM_DIR="$CONFIG_DIR/awesome/"
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

which nvim
if [ $? -eq "0" ]; then
    echo "Located nvim is installed. Trying to link it as well."
    NVIM_DIR="$CONFIG_DIR/nvim/"
    if [ ! -d "$NVIM_DIR" ]; then
        echo "Creating the directory for nvim config."
        mkdir -p "$NVIM_DIR"
    fi
    ln --symbolic "$HOME/.vimrc" "$NVIM_DIR/init.vim"
fi

echo "Trying to link neovim settings"
