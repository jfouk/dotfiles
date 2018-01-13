"--------------- General ------------------"

"source plugins
source $HOME/.vim/plugins.vim

syntax on
syntax keyword cppType uint64 int64 uint32 int32 uint16 int16 uint8 int8
syntax keyword cType uint64 int64 uint32 int32 uint16 int16 uint8 int8

filetype on
filetype plugin on
filetype indent on

set nocp    "set no compatible mode
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
set listchars=tab:\ \ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
set list

"set csto=1  "search ctags before cscope tags
set csto=0  "search ctags before cscope tags
"markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

"let &t_ZH = "\e[3m"
"let &t_ZR = "\e[23m"
set t_ZH=[3m
set t_ZR=[23m

"trying
"set cscopetag

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

"""""""""" Syntastic Settings """"""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_remove_include_errors = 1

"""""""" Fugitive Settings and Aliases """""""""
set diffopt+=vertical
nnoremap do2 :diffget //2<CR> :diffupdate<CR>
nnoremap do3 :diffget //3<CR> :diffupdate<CR>

"""""""" OrgMode """""""""""""
let g:org_agenda_files = ['~/Development/Notes/*.org']
let g:org_indent =1
imap <NL> <Plug>OrgNewHeadingBelowInsert
imap <M-CR> <Plug>OrgNewHeadingBelowInsert
imap <C-e> <C-o>:execute "normal! ==<<gi"<CR>
autocmd FileType org :call FixOrgIndentMappings()
function! FixOrgIndentMappings()
    " Indent and Unindent and Realign
    iunmap <buffer> <c-d>
    iunmap <buffer> <c-t>
    imap <buffer> <c-d> <C-o>:execute "normal! <<==A"<CR>
    imap <buffer> <c-t> <C-o>:execute "normal! >>==A"<CR>
endfunction

let g:utl_cfg_hdl_scm_http_system = "silent !open -a Firefox '%u#%f'"

""""""""" Vim Prosession Settings""""""""""
"let g:prosession_tmux_title = 1
"let g:solarized_contrast='high'
"let g:solarized_termcolors=16
"set term=screen-256color
"set t_Co=16
"

""""""""" Vimwiki """""""""""""

"let g:vimwiki_list = [{'path': '~/my_site/',
                       "\ 'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_folding = 'list'
set background=dark
let g:hybrid_use_Xresources = 1
let g:gruvbox_contrast_dark = 'hard'
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

command! Locate call fzf#run(
      \ {'source': 'cscope find g .*', 'sink': 'e', 'options': '-m'})

      "\ {'source': 'cscope/afs/rchland.ibm.com/usr5/phypbld/afw/afw860/builds/LATEST/cscope/afwp/cscope.out -L1 .*', 'sink': 'e', 'options': '-m'})
nmap <leader>j :bnext<CR>
nmap <leader>k :bp<CR>

"ctrl-p
nnoremap <leader>F :CtrlP<CR>
nnoremap <leader>B :CtrlPBuffer<CR>
nnoremap <leader>M :CtrlPMRUFiles<CR>
nnoremap <leader>T :CtrlPBufTag<CR>
"fzf
"nnoremap <leader>f :FZFR<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :BufTags<CR>
nnoremap <leader>o :FZF! $ORG_NOTES<CR>
nnoremap <leader>h :OrgHeaders<CR>
nnoremap <leader>l :BLines!<CR>
let $FZF_DEFAULT_COMMAND = 'ag -l -f --hidden -g ""'
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
    let g:gruvbox_italic=0
else
    set clipboard=unnamedplus
    let g:gruvbox_italic=1
endif

set guioptions-=T  "remove toolbar
map <A-o> <plug>NERDTreeTabsToggle<CR>
"nnoremap <A-u> :GundoToggle<CR>


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
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme='badwolf'
"let g:airline_theme='solarized'
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamemod = '.'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
set laststatus=2
"let g:airline_section_c = '%t'
"let g:airline_section_warning = '%{ObsessionStatus()}'
"set statusline+=%{ObsessionStatus()}

"ctrlp
let g:ctrlp_max_files = 10000
"let g:ctrlp_match_window = 'bottom,order:ttb'  
let g:ctrlp_switch_buffer = 0   "hopefully always open in same window
let g:ctrlp_follow_symlinks = 1 "follow symlinks but ignore looped
let g:ctrlp_working_path_mode = 'ra' "search from either current directory or the closest .git file to CWD? not sure
"let g:ctrlp_working_path_mode = 0 "search from either current directory or the closest .git file to CWD? not sure
"let g:ctrlp_user_command = 'ag %s -l -U --hidden -g ""'
nnoremap <leader>r :CtrlPClearCache <CR>
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -f -l -U --hidden --nocolor -g ""'
  let g:ctrlp_user_command = 'ag %s -i -f --hidden --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ -g ""'
endif
let g:ctrlp_root_markers = ['src/']
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
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

"easytags
let g:easytags_include_members = 1
let g:easytags_async = 1

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

function! s:find_root()
    for vcs in ['.mark','.git', 'src']
        " look a couple directories up
        let dir = finddir(vcs.'/..', fnamemodify(expand('%:p'),':p:h').';'.fnamemodify(expand('%:p'),':p:h:h:h:h:h'))
            if !empty(dir)
                execute 'FZF!' dir
                "echo dir
            return
        endif
    endfor
    execute 'FZF!' fnamemodify(expand('%:p'),':p:h')
endfunction

command! FZFR call s:find_root()


function! BBLoad(release, build)
    let release = a:release
    let build = a:build
    let c_path = "/afs/rchland.ibm.com/usr5/phypbld/afw/".release."/builds/".build."/src"
    echo "Set backing build to ".c_path
    execute "nnoremap <leader>p :FZF! ". c_path."<CR>"
endfunction
command! -nargs=* BBload call BBLoad(<f-args>)

function! Pinit(release, build)
    let release = a:release
    let build = a:build
    "call BBLoad(release, build)
    execute "nnoremap <leader>p :AfwFiles ". release."<CR>"
    call CsLoad(release, build)
endfunction
command! -nargs=* Pinit call Pinit(<f-args>)
    
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
"

"
" ----------------------------------------------------------------------------
" BTags
" ----------------------------------------------------------------------------
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

"function! s:btags_source()
  ""let lines = map(split(system(printf(
    ""\ 'ctags -f - --sort=no --fields=nKs --excmd=pattern --language-force=%s %s',
    ""\ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  ""if v:shell_error
    ""throw 'failed to extract tags'
  ""endif
  "for cmd in [
    "\ printf('ctags -f - --sort=no --fields=nKs --excmd=pattern --language-force=%s %s', &filetype, expand('%:S'))]
    ""\ printf('ctags -f - --sort=no --fields=nKs --excmd=pattern %s', expand('%:S'))]
    "let lines = split(system(cmd), "\n")
    "if !v:shell_error
      "break
    "endif
  "endfor

  ""return map(s:align_lists(lines), 'join(v:val, "\t")')
  "return map(s:align_lists(map(lines, 'split(v:val, "\t")')), 'join(v:val, "\t")')
"endfunction

function! s:btags_sink(line)
  let lines = split(a:line, "\t")
  for line in lines
      let arr = split(line, ":")
      if arr[0] == "line"
          exec arr[-1]
      endif
  endfor
  sil! norm! zvzz
endfunction

function! s:btags_source()
  if !filereadable(expand('%'))
    throw 'Save the file first'
  endif
"ctags -f - --sort=no --fields=nKs --excmd=number simple_alarm_clock.py | perl -ne 'unless (/^\!/) { s/^(.*?)\t(.*?)\t/\x1b[33m\1\x1b[m\t\x1b[34m\2\x1b[m\t/; print }'
    "\ printf('ctags -f - --sort=no --fields=nKs --excmd=number %s | perl -ne "unless (/^\!/) { s/^(.*?)\t(.*?)\t/\x1b[33m\1\x1b[m\t\x1b[34m\2\x1b[m\t/; print }"', expand('%:S'))]
  for cmd in [
    \ printf('ctags -f - --sort=no --fields=nKs --excmd=number %s | 
    \ perl -ne "unless (/^\!/) { 
    \ s/^(.*?)\t/\x1b[33m\1\x1b[m\t/; 
    \ s/\t(function)\t/\t\x1b[32m\1\x1b[m\t/; 
    \ s/\t(member)\t/\t\x1b[35m\1\x1b[m\t/; 
    \ s/\t(variable)\t/\t\x1b[35m\1\x1b[m\t/; 
    \ s/\t(macro)\t/\t\x1b[36m\1\x1b[m\t/; 
    \ s/\t(namespace)\t/\t\x1b[36m\1\x1b[m\t/; 
    \ s/\t(class)\t/\t\x1b[34m\1\x1b[m\t/;
    \ print }"', expand('%:S'))]
    let lines = split(system(cmd), "\n")
    if !v:shell_error
      break
    endif
  endfor
  if v:shell_error
    throw get(lines, 0, 'Failed to extract tags')
  elseif empty(lines)
    throw 'No tags found'
  endif
  "for line in lines[1:]
    "execute split(line, "\t")[2]
    "let line = line. {'filename': expand('%'), 'lnum': line('.'), 'text': getline('.')})
    "echo line
    "exe input("","")
  "endfor
  return map(s:align_lists(map(lines, 'split(v:val, "\t")')), 'join(v:val, "\t")')
  "return lines
endfunction

"function! s:btags_sink(lines)
  "if len(a:lines) < 2
    "return
  "endif
  "let cmd = get(get(g:, 'fzf_action', s:default_action), a:lines[0], '')
  "if !empty(cmd)
    "execute 'silent' cmd '%'
  "endif
  "let qfl = []
  "for line in a:lines[1:]
    "execute split(line, "\t")[2]
    "call add(qfl, {'filename': expand('%'), 'lnum': line('.'), 'text': getline('.')})
  "endfor
  "if len(qfl) > 1
    "call setqflist(qfl)
    "copen
    "wincmd p
    "cfirst
  "endif
  "normal! zz
"endfunction

function! s:btags()
  try
    call fzf#run({'source':  s:btags_source(),
                 \'options': '--ansi -m -d "\t" --with-nth 4,1,5,6 --tiebreak=begin --prompt "Tags> "',
                  \'down': 20,
                 \'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BufTags call s:btags()

"Org Headings

function! s:orgtags_source()
    "let lines = split(system('cat '.expand('%:S').' | ag "^\*"'), "\n")
    "let lines = getline(1,"$")
    let lines = split(system('ag "^\*" '.expand('%:S')), "\n")
    return map(lines, 'substitute(v:val,"\*\\( \\)\\@!","  ","g")')
    "return lines
endfunction

function! s:orgtags_sink(lines)
    let keys = split(a:lines, ':')
    exec keys[0]
endfunction

function! s:orgtags()
  try
    call fzf#run({'source':  reverse(s:orgtags_source()),
                 \'options': '--ansi -m -d "\t" --tiebreak=begin --prompt "Headers> "',
                 \'sink':    function('s:orgtags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction
command! OrgHeaders call s:orgtags()


"Afw Files

function! s:afw_source(version)
    "let lines = split(system('cat '.expand('%:S').' | ag "^\*"'), "\n")
    "let lines = getline(1,"$")
    let s:afw_version=a:version
    let lines = split(system('cat ~/.vim/.projectcache/'.a:version.'_LATEST'), "\n")
    return map(lines, 'substitute(v:val,"\*\\( \\)\\@!","  ","g")')
    "return lines
endfunction

function! s:afw_sink(file)
    execute "edit /afs/rchland.ibm.com/usr5/phypbld/afw/".s:afw_version."/builds/LATEST/src/". a:file 
endfunction

function! s:afw_files(version)
  try
      call fzf#run({'source':  s:afw_source(a:version),
                  \'options': '--ansi -m -d "\t" --tiebreak=end --prompt '.a:version.'"> "',
                  \'down': 20,
                 \'sink':    function('s:afw_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction
command! -nargs=* AfwFiles call s:afw_files(<q-args>)

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif
