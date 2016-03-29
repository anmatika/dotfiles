:set mouse=a
set number
set relativenumber
set nocompatible              
filetype off                

"PLUGINS
"*************
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'

call vundle#end()            " required
filetype plugin indent on    " required
let mapleader = ","

"KEY MAPPINGS
"***************
map <Leader>n :NERDTreeToggle <Esc>
map <Leader>m :NERDTreeFind <Esc>
imap <left> <Nop>
imap <up> <Nop>
imap <right> <Nop>
imap <down> <Nop>
nmap <left> <Nop>
nmap <up> <Nop>
nmap <right> <Nop>
nmap <down> <Nop>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
map <C-p> :CtrlP<CR>
