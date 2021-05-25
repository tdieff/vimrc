set shortmess+=I                    " Disable default Vim startup message
set nocompatible
set backspace=indent,eol,start
set hidden
nmap Q <Nop>
set noerrorbells visualbell t_vb=

set number
set relativenumber

set tabstop=4
set shiftwidth=4
set autoindent
set lbr
set listchars=tab:\.\ 
set list

set colorcolumn=80

set incsearch
set smartcase
set showcmd
set confirm

"Cursor settings:
let &t_SI.="\e[1 q" "SI = INSERT mode
let &t_SR.="\e[1 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode
"1 -> blinking block
"2 -> solid block
"3 -> blinking underscore
"4 -> solid underscore
"5 -> blinking vertical bar
"6 -> solid vertical bar

colorscheme dracula
" muon
" rigel
" meta5
" molokai
" monokai_pro
" moonfly
" kalisi
" elrodeo
" zenburn
" tokyonight
" substrata
" space-vim-dark
" sierra

filetype plugin indent on

syntax on
highlight Comment ctermfg=235 ctermbg=239
highlight LineNr ctermfg=247

set laststatus=2

hi User1 ctermfg=238 ctermbg=235
hi User2 ctermfg=240 ctermbg=236
hi User3 ctermfg=241 ctermbg=236
hi User4 ctermfg=241 ctermbg=236

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}

set statusline+=%2*\ %<%F%*
set statusline+=%3*\ %=\ line:%l/%L
set statusline+=%4*\ col:%03c

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"highlight link javaScopeDec1 Statement
"highlight link javaType Type
"highlight link javaDocTags PreProc

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})

call minpac#add('vim-syntastic/syntastic')
let g:syntastic_java_checkers = ['javac']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1

call minpac#add('preservim/nerdcommenter')


command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

