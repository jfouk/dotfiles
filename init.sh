#!/bin/sh
#init script

#path to where all these files are
SETUP=$PWD
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
    ln -s $SETUP/tmux/.tmux.conf $HOME/.tmux.conf
fi
if [ ! -f $HOME/.vimrc ]; then
    echo "Linking vimrc"
    ln -s $SETUP/vim/.vimrc $HOME/.vimrc
fi
if [ ! -f $HOME/.vim/plugins.vim ]; then
    echo "Linking vim plugins"
    ln -s $SETUP/vim/plugins.vim $HOME/.vim/plugins.vim
fi

###### Mac installs ##########
if [ "$OS" == "Mac OS X" ]; then
    #copy over extra tmux file
    cp $SETUP/tmux/.tmux-osx.conf $HOME/.tmux-extra.conf
    #install the_silver_searcher
    brew install the_silver_searcher
    #for tmux copy
    brew install reattach-to-user-namespace
elif [ "$OS" == "Linux" ]; then
    #copy over extra tmux file
    cp $SETUP/tmux/.tmux-linux.conf $HOME/.tmux-extra.conf
    #install the_silver_searcher
    sudo yum install the_silver_searcher
fi

#installs if linux

#vundle install

#zshrc/bashrc 
#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# mac installs
# brew install reattach-to-user-namespace
