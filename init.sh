#!/bin/bash
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

#---------------- Link bashrc file ----------------
# note switch this to zsh later when we remember how
# first make backup of old bashrc file, check if is linked file
if [ ! -L $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc_firstbackup
    ln -s $SETUP/bash/.bashrc_windows $HOME/.bashrc
fi
if [ ! -f $HOME/.bash_aliases ]; then
    ln -s $SETUP/bash/.bash_aliases $HOME/.bash_aliases
fi
if [ ! -f $HOME/.bash_functions ]; then
    ln -s $SETUP/bash/.bash_functions $HOME/.bash_functions
fi

#---------------- Link Config Files ----------------
#link config files to home directory if files do not already exist
if [ ! -d $HOME/.tmux ]; then
    echo "Making .tmux dir"
    mkdir $HOME/.tmux
fi
if [ ! -f $HOME/.tmux.conf ]; then
    echo "Linking tmux config"
    ln -s $SETUP/tmux/.tmux.conf $HOME/.tmux.conf
fi
if [ ! -f $HOME/.vimrc ]; then
    echo "Linking vimrc"
    ln -s $SETUP/vim/.vimrc $HOME/.vimrc
fi
if [ ! -d $HOME/.vim ]; then
    echo "Making .vim dir"
    mkdir $HOME/.vim
fi
if [ ! -f $HOME/.vim/plugins.vim ]; then
    echo "Linking vim plugins"
    ln -s $SETUP/vim/plugins.vim $HOME/.vim/plugins.vim
fi
if [ ! -f $HOME/.dircolors ]; then
    echo "Linking dircolors"
    ln -s $SETUP/.dircolors/ $HOME/.dircolors
fi
if [ ! -d $HOME/.vimswp ]; then
    echo "Creating .vimswp"
    mkdir $HOME/.vimswp
fi
# NOTE: Not using powerline themes yet, decide on new one to use
#tmux powerline themes
# make directories if not there
#if [ ! -d $HOME/.tmux/powerline ]; then
#    echo "Make tmux-powerline directory"
#    mkdir $HOME/.tmux/powerline
#fi
#if [ ! -d $HOME/.tmux/powerline/themes ]; then
#    echo "Make tmux-powerline/themes directory"
#    mkdir $HOME/.tmux/powerline/themes
#fi
#if [ ! -d $HOME/.tmux/powerline/segments ]; then
#    echo "Make tmux-powerline/segments directory"
#    mkdir $HOME/.tmux/powerline/segments
#fi
#link theme files
#if [ ! -f $HOME/.tmux/powerline/themes/jfouktheme.sh ]; then
#    echo "Linking powerline themes"
#    ln -s $SETUP/tmux/jfouktheme.sh $HOME/.tmux/powerline/themes/jfouktheme.sh
#fi
#if [ ! -f $HOME/.tmux/powerline/segments/now_playing.sh ]; then
#    echo "Linking powerline now_playing segment"
#    ln -s $SETUP/tmux/now_playing.sh $HOME/.tmux/powerline/segments/now_playing.sh
#fi
#if [ ! -f $HOME/.tmux-powerlinerc ]; then
#    echo "Linking powerline config"
#    ln -s $SETUP/tmux/.tmux-powerlinerc $HOME/.tmux-powerlinerc
#fi

#---------------- Mac Specific Installs ----------------
if [ "$OS" == "Mac OS X" ]; then
    #copy over extra tmux file
    cp $SETUP/tmux/.tmux-osx.conf $HOME/.tmux-extra.conf
    #install the_silver_searcher
    brew install the_silver_searcher
    #for tmux copy
    brew install reattach-to-user-namespace
    #exuberant ctags
    brew install ctags
    #dont forget to add PATH=/usr/local/bin:$PATH to zshrc

#---------------- Linux Specific Installs ----------------
elif [ "$OS" == "Linux" ]; then
    #copy over extra tmux file
    cp $SETUP/tmux/.tmux-linux.conf $HOME/.tmux-extra.conf
    read -p "Is this Ubuntu?" -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        #install the_silver_searcher
        sudo yum install the_silver_searcher
    else
        sudo apt-get install silversearcher-ag
    fi
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

# Install fonts
PARENT="$(dirname "$SETUP")"
if [ ! -d $PARENT/fonts ]; then
    echo "Installing fonts"
    git clone https://github.com/powerline/fonts $PARENT/fonts
    $PARENT/fonts/init.sh
fi
#installs if linux

#vundle install
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# instal wsltty
#urxvt
#if [ ! -f $HOME/.Xresources ]; then
    #echo "Linking .Xresources and .Xdefaults"
    #ln -s $SETUP/urxvt/.Xresources $HOME/.Xresources
    #ln -s $HOME/.Xresources $HOME/.Xdefaults
    #sudo apt-get install x11-xserver-utils
#fi

#zshrc/bashrc 
#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# mac installs
# brew install reattach-to-user-namespace
