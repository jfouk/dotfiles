#!/bin/sh
#---------------- Initialization Script ----------------

## Setup path variables and determine OS
# path to where all these files are
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

# Confirmation of OS
echo "Running install script for $OS"
read -p "Would you like to proceed with the installation?" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi


#---------------- Link Config Files ----------------
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

#tmux powerline themes
# make directories if not there
if [ ! -d $HOME/.tmux/powerline ]; then
    echo "Make tmux-powerline directory"
    mkdir $HOME/.tmux/powerline
fi
if [ ! -d $HOME/.tmux/powerline/themes ]; then
    echo "Make tmux-powerline/themes directory"
    mkdir $HOME/.tmux/powerline/themes
fi
if [ ! -d $HOME/.tmux/powerline/segments ]; then
    echo "Make tmux-powerline/segments directory"
    mkdir $HOME/.tmux/powerline/segments
fi
#link theme files
if [ ! -f $HOME/.tmux/powerline/themes/jfouktheme.sh ]; then
    echo "Linking powerline themes"
    ln -s $SETUP/tmux/jfouktheme.sh $HOME/.tmux/powerline/themes/jfouktheme.sh
fi
if [ ! -f $HOME/.tmux/powerline/segments/now_playing.sh ]; then
    echo "Linking powerline now_playing segment"
    ln -s $SETUP/tmux/now_playing.sh $HOME/.tmux/powerline/segments/now_playing.sh
fi
if [ ! -f $HOME/.tmux-powerlinerc ]; then
    echo "Linking powerline config"
    ln -s $SETUP/tmux/.tmux-powerlinerc $HOME/.tmux-powerlinerc
fi

#---------------- Mac Specific Installs ----------------
if [ "$OS" == "Mac OS X" ]; then
    #copy over extra tmux file
    cp $SETUP/tmux/.tmux-osx.conf $HOME/.tmux-extra.conf
    #install the_silver_searcher
    brew install the_silver_searcher
    #for tmux copy
    brew install reattach-to-user-namespace

#---------------- Linux Specific Installs ----------------
elif [ "$OS" == "Linux" ]; then
    #copy over extra tmux file
    cp $SETUP/tmux/.tmux-linux.conf $HOME/.tmux-extra.conf
    #install the_silver_searcher
    sudo yum install the_silver_searcher
fi


#---------------- General Installs ----------------

if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    echo "Installing Tmux Plugin Manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "Installing fzf"
    #for fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

fi
#installs if linux

#vundle install

#zshrc/bashrc 
#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# mac installs
# brew install reattach-to-user-namespace
