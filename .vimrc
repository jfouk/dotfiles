set nocompatible              " be iMproved, required
filetype off                  " required

syntax on
syntax keyword cppType uint64 int64 uint32 int32 uint16 int16 uint8 int8
syntax keyword cType uint64 int64 uint32 int32 uint16 int16 uint8 int8
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
filetype on
filetype plugin on
filetype indent on

set nocp
set number
set et
set sw=4
set smarttab
set backspace=indent,eol,start
set showmatch
set smartcase
"set incsearch
set hidden
set hlsearch
"noremap <F5> :set hls!<CR>
"set autoindent
"set smartindent
set cindent
set scrolloff=5
set sidescrolloff=5
set cmdheight=2
set complete=.,w,b,u,U,t,i,d
set ttyfast
set wildmode=longest,list,full
set wildmenu
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"set foldmethod=syntax
"set foldcolumn=2
set ruler
set more
set showmode
set nocompatible
set so=0

"colors gruvbox
"colors zenburn
"autocmd BufEnter * lcd %:p:h

" This autocmd and function is for updating NERDTree whenever the Buffer is
" switched, it finds the file in the NERDTree window and then switches focus
" back to the buffer you were on
"autocmd BufEnter * :call NERDupdate()
function! NERDupdate()
    let newBufNr = bufnr("%")
    let isListed = buflisted(newBufNr)
"    echo isListed
    if(isListed)
        exe "NERDTreeTabsFind"
        " jump back to previous window
        exe "wincmd p"                  
    endif
endfunction


au FuncUndefined FF* source ~/.vim/findfile.vim
"map <C-E> :call FF("")<CR>
"map <C-A> :call AIH()<CR>

"fugitive
"autocmd BufReadPost fugitive://* set bufhidden=delete
"" Unset 'list' in :Gstatus window (which usually contains tab characters).
"autocmd BufReadPost .git/index set nolist

"source ~/.vim/plugin/bufexplorer.vim
"let g:bufExplorerSplitBelow = 1
"let g:bufExplorerOpenMode = 1
"let g:bufExplorerSplitHorzSize = 7

"let g:BufList_Hide=0
"source ~/.vim/plugin/buflist.vim
"call BufList_Open()
"let g:miniBufExplVSplit = 25    " column width in chars, go vertical
"let g:miniBufExplVSplit = 0    " column width in chars, go vertical
"let g:miniBufExplSplitBelow = 0 " right side column
"let g:miniBufExplUseSingleClick = 1 " single click to open buffers
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:solarized_contrast='high'
"let g:solarized_termcolors=16
"set term=screen-256color
"set t_Co=16
set background=dark
let g:hybrid_use_Xresources = 1
let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_italic=1
"let g:colorsbox_contrast_dark = 'medium'
colo gruvbox
"set csprg=/afs/rchland.ibm.com/usr6/pbarrett/public/bin/run_cscope-vim
"if &diff
"else
    "    cscope add /tmp/cscope.akoch.out /tmp -STARTHERE-E-rv7r1m0.afw-dcur-pafw
    "    cscope add /tmp/cscope.akoch-1.out /tmp -STARTHERE-E-rv7r1m0.afwp-dcur-pafwp
    "    cscope add /tmp/cscope.akoch-2.out /tmp -STARTHERE-E-rv7r1m0.phyp-dcur-pphyp
"endif
"let g:CscopeDbs = ['afw','afwp', 'phyp.v7r1m0']
"let g:CscopeDbNames = ['select db:', '1. afw', '2. afwp', '3. phyp v7r1m0']
"let g:CscopeCurrentDb = 1 " based on CscopeDbNames

"nmap <C-\>s :call CscopeExec('s', expand("<cword>"))<CR>
"nmap <C-\>g :call CscopeExec('g', expand("<cword>"))<CR>
"nmap <C-\>c :call CscopeExec('c', expand("<cword>"))<CR>
"nmap <C-\>t :call CscopeExec('t', expand("<cword>"))<CR>
"nmap <C-\>e :call CscopeExec('e', expand("<cword>"))<CR>
"nmap <C-\>f :call CscopeExec('f', expand("<cfile>"))<CR>
"nmap <C-\>i :call CscopeExec('i', expand("<cfile>"))<CR>
"nmap <C-\>d :call CscopeExec('d', expand("<cword>"))<CR>

noremap <F6> :YRShow<CR>

" indent options: 
"   g2 (C++ scope in 2 chars)
"   h2 (statements after scope in 2 chars)
"   i0 (constructor initializers 0 chars)
"   (0 (multi-line if statements properly)
set cino=g2,h2,i0,(0

" map indents
"map! <F7> <Esc>vaB=%
"nmap <F7> <Esc>vaB=%

" replace 0th yanked word with current word
"map S diw"0p
nmap <silent> S :let @x=@"<CR>"_diw"xP

"set dir=~/.vimswps

"set makeprg=rcomp\ makecurrent\ -m\ \"LIDNAME=80a00998.lid\"\ -cwd\ ~/dev2000/converge/v7r1m0.afwp/usr-vnic/cmvc/base.tools/\ image
set efm=\"%f\"\\,\ line\ %l.%c:\ %*\\d-%*\\d\ (S)\ %m 

nmap <c-k> d$
map <s-PageUp> :bp<CR>
map <s-PageDown> :bn<CR>


"set tags+=~/.vim/tags/v7r1m0_afwp_cur
"set tags+=.tags
"map <C-F12> :!~/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f.tags .<CR>

"" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 0 
"let OmniCpp_MayCompleteArrow = 0
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
"au BufEnter /* call LoadCscope()
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

"Commands by Jon
function! CsLoad(release, build)
    let release = a:release
    let build = a:build
    let c_path = "/afs/rchland.ibm.com/usr5/phypbld/afw/".release."/builds/".build."/cscope/afwp"
    execute "cs add ". c_path
endfunction
command! -nargs=* Csload call CsLoad(<f-args>)

command Cafw850 cs add /afs/rchland.ibm.com/usr5/phypbld/afw/afw850/builds/LATEST/cscope/afwp 

nmap <leader>j :bnext<CR>
nmap <leader>k :bp<CR>

"ctrl-p
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>t :CtrlPTag<CR>

set path+=$PWD/**

"taglist config
let Tlist_Show_One_File = 1
nnoremap <silent> <C-Tab> :TlistToggle<CR> 
"gets rid of unable to open swap file error
"set directory=.,$TEMP

"allow swp files in that dir
set backupdir=$HOME/.vimswp//
set directory=$HOME/.vimswp//

set mouse=a
if has("mac")
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

set guioptions-=T  "remove toolbar
map <A-o> <plug>NERDTreeTabsToggle<CR>
"nnoremap <A-u> :GundoToggle<CR>


nnoremap <leader>o :NERDTreeTabsToggle <CR>
nnoremap <leader>O :NERDTreeFind <CR>
"nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader><Tab> :TlistToggle<CR> 

let g:undotree_SetFocusWhenToggle = 1

"nerdtree_tabs
"let g:nerdtree_tabs_open_on_console_startup=1
"let g:nerdtree_tabs_autofind=1
let NERDTreeHijackNetrw=1
"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamemod = '.'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
set laststatus=2

"ctrlp
let g:ctrlp_max_files = 10000
"let g:ctrlp_match_window = 'bottom,order:ttb'  
let g:ctrlp_switch_buffer = 0   "hopefully always open in same window
let g:ctrlp_follow_symlinks = 1 "follow symlinks but ignore looped
let g:ctrlp_working_path_mode = 'wra' "search from either current directory or the closest .git file to CWD? not sure
"let g:ctrlp_working_path_mode = 0 "search from either current directory or the closest .git file to CWD? not sure
"let g:ctrlp_user_command = 'ag %s -l -U --hidden -g ""'
nnoremap <leader>r :CtrlPClearCache <CR>
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -U --hidden --nocolor -g ""'
endif
let g:ctrlp_root_markers = ['src/']

"ctrlp function
"delc Cb
"command Cb :CtrlPBookmarkDirAdd <CR> | "1" <CR>
"nmap cb :CtrlPBookmarkDirAdd <CR>test<CR>
"function! CtrlPAutoBookmark(number)
"    let number = a:number
"    echo number
""    execute "normal :CtrlPBookmarkDirAdd \<c-u>".number."\<cr>"
""    execute "nmap <leader>".number." :CtrlPBookmarkDir <CR>".number."<CR>"
"    exe ":CtrlPBookmarkDirAdd" | echo "theend"
""        nnoremap <leader>{number} :CtrlPBookmarkDir<CR>{g:Cb1}<CR>
"endfunction
"
"function! CtrlPAutoBookmarkRead(number)
"    let number = a:number
"    let name = "g:Cb".number
""    execute "CtrlPBookmarkDir<CR>".{name}."<CR>"
""    execute "normal! :CtrlPBookmarkDir\<cr>".{name}."\<cr>"
"    execute "normal :CtrlPBookmarkDir\<cr>".{name}."\<cr>"
"endfunction


"let g:ctrlp_prompt_mappings = {
"      \ 'PrtClearCache()':      ['<c-q>'],
"      \ }
"exit out of insert mode speed
set timeoutlen=1000 ttimeoutlen=0

"Toggle delete to buffer
function! ToggleSideEffects()
    if mapcheck("dd", "n") == ""
        noremap dd "_dd
        noremap D "_D
        noremap d "_d
        noremap X "_X
        noremap x "_x
        echo 'Delete to buffer off!!'
    else
        unmap dd
        unmap D
        unmap d
        unmap X
        unmap x
        echo 'Delete to buffer on!!'
    endif
endfunction
nnoremap ,, :call ToggleSideEffects()<CR>

"undo history
set undodir=$HOME/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload


"function! Todo()
"    let tomorrow = /    TT\>/ y  
"    echo tomorrow
"endfunction

" TRIAL FUNCTION -- DISREGARD EVERYTHING BELOW THIS LINE
" =====================================================
"function! Test001()
"    let file = readfile(expand("%:p")) " read current file
"    let tomorrow = range(50)
"    for item in range(50)
"        let tomorrow[item] = '0'
"    endfor
"    let ptime = 0
"    for line in file
"        if(ptime==0)
"            let days = [".*Monday",'.*Tuesday',"Wednesday","Thursday","Friday"]
""    let     match = matchstr(line, '.*TT') " regex match
"            for exp in days
"                let match = matchstr(line, exp) " regex match
"                if(!empty(match))
""                    echo line
"                    let i = 0
"                endif
"            endfor
"            " check for stuff to move into tomorrow
""            let tt = matchstr(line, '.*TT') " regex match
""            if(!empty(tt))
"            if match(line, 'TT-')!= -1
"                let tomorrow[i] = substitute(line,"TT","","")      " store all lines to move to tomorrow
"                let i = i+1
"            endif
""            let tom = matchstr(line, '^TOMORROW&') " regex match
"            if match(line, '^TOMORROW$')!= -1
"            "if(!empty(tom))
"                let ptime = 1 
"                echo "found tomorrow"
"            endif
"        else    "within TOMORROW
"            echo "in tland"
"            for iter in range(i)
"                let same = matchstr(line,tomorrow[iter])
"                echo line
"                if(!empty(same))
"                    let tomorrow[iter] = '0'
"                    echo "same string"
"                endif
"            endfor
"            if match(line, '^\s*$')!=-1 " regex match
"                let ptime = 0
"                for iter in range(i)
"                    if (tomorrow[iter] != '0')
"                        echo tomorrow[iter]
"                        put = tomorrow[iter]
"                        let tomorrow[iter] = '0'
"                    endif
"                endfor
"            endif
"        endif
"    endfor
""    for iter in range(i)
""        if (tomorrow[iter] != '0')
""            echo tomorrow[iter]
""            put = tomorrow[iter]
""            let tomorrow[iter] = '0'
""        endif
""    endfor
"endfunction
