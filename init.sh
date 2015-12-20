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

#link config files to home directory if files do not already exist
if [ ! -f $HOME/.tmux.conf ]; then
    echo "Linking tmux config"
    ln -s ~/Development/Setup/dotfiles/.tmux.conf ~/.tmux.conf
fi
if [ ! -f $HOME/.vimrc ]; then
    echo "Linking vimrc"
    ln -s ~/Development/Setup/dotfiles/.vimrc ~/.vimrc
fi


###### Mac installs ##########
if [ "$OS" == "Mac OS X" ]; then
    #copy over extra tmux file
    cp .tmux-osx.conf $HOME/.tmux-extra.conf
    #install the_silver_searcher
    brew install the_silver_searcher
    #for tmux copy
    brew install reattach-to-user-namespace
elif [ "$OS" == "Linux" ]; then
    #copy over extra tmux file
    cp .tmux-linux.conf $HOME/.tmux-extra.conf
    #install the_silver_searcher
    sudo yum install the_silver_searcher
fi

#installs if linux

#vundle install

#zshrc/bashrc 
#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# mac installs
# brew install reattach-to-user-namespace
