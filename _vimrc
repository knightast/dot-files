" vim configure file
" Author: Heng LIN (linheng.thu@gmail.com)

if v:progname =~? "evim"
  finish
endif

call pathogen#infect()

" Display related settings
set nocompatible
set background=dark
set foldmethod=marker
set matchtime=1
set number
set ruler
set showcmd
set showmatch
set scrolloff=3
"set wildmenu
"set nowrap
set ignorecase
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Operation related settings
set backspace=indent,eol,start
set history=50
set incsearch
if has("mouse")
  set mouse=
endif

" File related settings
set noerrorbells
set autoread
set encoding=utf-8
"set backup
set fileencodings=ucs-bom,utf-8,gb18030,default,latin1
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=8
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
    autocmd!
    autocmd FileType text setlocal textwidth=78
    autocmd BufReadPost *
      \   if line("'\"") > 1 && line("\"") <= line("$")
      \ |   execute "normal! g`\""
      \ | endif
  augroup END
else
  set autoindent
endif

" Miscellaneous settings
map Q gq
imap jj <Esc>
vnoremap // y/<C-R>"<CR>

map <F9> :TagbarToggle<cr>
map <F8> :NERDTreeToggle<cr>
map <F5> :w <bar> make<cr>

au BufNewFile,BufRead *.cl set filetype=c
set diffopt+=iwhite
