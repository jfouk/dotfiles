"----------------- Vundle Plugins -------------------"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'file:///~/vimplugins/'
Plugin 'jewes/Conque-Shell'

Plugin 'WolfgangMehner/vim-plugins'
Plugin 'mbbill/code_complete'
Plugin 'morhetz/gruvbox'
Plugin 'taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'nanotech/jellybeans.vim'
Plugin 'antlypls/vim-colors-codeschool' 
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'sjl/gundo.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'mkarmona/colorsbox'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mbbill/undotree'
Plugin 'dhruvasagar/vim-vinegar'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
