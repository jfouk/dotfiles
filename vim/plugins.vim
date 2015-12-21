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
"--------------- Editor Enhancements --------------
Plugin 'Yggdroot/indentLine'        "indentation lines
Plugin 'scrooloose/nerdcommenter'   "easy comments
Plugin 'scrooloose/syntastic'   "TODO setup
Plugin 'taglist.vim'                "function lists
Plugin 'mbbill/undotree'            "undo tree
Plugin 'ludovicchabant/vim-gutentags'

"--------------- Directory navigation --------------
Plugin 'ctrlpvim/ctrlp.vim'         "fuzzy file searcher
Plugin 'scrooloose/nerdtree'        "dir tree
Plugin 'dhruvasagar/vim-vinegar'    "nerdtree enabler
Plugin 'tpope/vim-fugitive'         "git utility

"--------------- Colorschemes and Customization --------------
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'joshdick/onedark.vim'
Plugin 'mkarmona/colorsbox'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'antlypls/vim-colors-codeschool' 

"--------------- Not in use  --------------
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'file:///~/vimplugins/'
"Plugin 'jewes/Conque-Shell'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'sjl/gundo.vim'
"Plugin 'WolfgangMehner/vim-plugins'
"Plugin 'mbbill/code_complete'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
