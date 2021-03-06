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
"Plugin 'ludovicchabant/vim-gutentags'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'jceb/vim-orgmode'
Plugin 'vim-scripts/utl.vim'
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'calendar.vim--Matsumoto'
Plugin 'SyntaxRange'
"Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession' " project sessions for obsession
"Plugin 'vimwiki/vimwiki'
"Plugin 'tpope/vim-markdown'
"Plugin 'JazzCore/ctrlp-cmatcher'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-abolish'          " search and replace matching case
Plugin 'xolox/vim-notes'            " Note taking plugin
Plugin 'dhruvasagar/vim-table-mode'

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
"Plugin 'junegunn/rainbow_parentheses.vim'

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
