" No compatibility to vi required
set nocompatible

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Show mode in bottom line
set showmode

" Search while typing
set incsearch

" Scrolling
set number relativenumber
set scrolloff=7

" Activate syntax highlighting
syntax enable

" Indentation settings
set autoindent smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Set timeouts, shorter timeout because timeout with <ESC> is annoying
set timeoutlen=500
set ttimeoutlen=50

" Repeat and put cursor to start of change
nmap . .`[

