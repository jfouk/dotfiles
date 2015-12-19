#!/bin/sh
#init script

#check os

case "$(uname -s)" in
    Darwin)
        OS='Mac OS X'
        ;;

    Linux)
        OS='Linux'
        ;;
    *)
        OS='Other OS'
        ;;
esac

echo "Running install script for $OS"
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

#link config files to home directory
#ln -s ~/Development/Setup/dotfiles/.tmux.conf ~/.tmux.conf
#ln -s ~/Development/Setup/dotfiles/.vimrc ~/.vimrc

#installs if linux
#sudo yum install the_silver_searcher

#vundle install

#zshrc/bashrc 
#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# mac installs
# brew install reattach-to-user-namespace
