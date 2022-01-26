" No compatibility to vi required
set nocompatible

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Activate syntax highlighting
syntax enable

" Activate relative lines numbers with absolute number for current line
set number relativenumber

" Indentation settings
set autoindent smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Set timeouts, shorter timeout because timeout with <ESC> is annoying
set timeoutlen=500
set ttimeoutlen=50

" Treat files as filetypes
autocmd! BufRead,BufNewFile *.tpp setfiletype c

" Load machine specific .vimrc file
if filereadable("~/.vimrc.local")
  source ~/.vimrc.local
endif
