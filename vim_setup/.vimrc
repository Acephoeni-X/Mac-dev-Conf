set ma									# set marks for in vim
syntax on								# syntax on in vim 
set number relativenumber						# set relative numbers on left side of vim
set autoindent								# common for python file 
set smarttab								# set tab = 4
set shiftwidth=2							
set smartindent								# same for python
set mouse=a								# enable mouse inside vim
nmap <C-t> :rightb :vert ter
nmap <C-n> :NERDTree
nmap <C-r> :w !python3
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/C++.cpp
:autocmd BufNewFile *.py 0r ~/.vim/templates/python.py


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'patstockwell/vim-monokai-tasty'
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()
colorscheme vim-monokai-tasty
highlight Normal ctermbg=black
nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<ENTER>  
nnoremap <C-x> :!./%:r.out
