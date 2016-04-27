set nocompatible              " be iMproved, required
filetype off                  " required
" ''''''''''''''''''''''''''''''''''''''''''''
" Vundle
" ''''''''''''''''''''''''''''''''''''''''''''
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'Decho'
call vundle#end()            " required

filetype plugin indent on    " required
syntax on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" Functions
function s:SetCursorLine()
    set cursorline
    "hi cursorline cterm=none ctermbg=darkblue ctermfg=white gui=underline
endfunction
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
function StartMaximized()
  if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window.
    set lines=999 columns=999
  endif
endfunction
function HideToolBarsAndScrollBars()
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endfunction

call HideToolBarsAndScrollBars()
call StartMaximized()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugin
filetype plugin on
filetype indent on
syntax on
set paste

" Filetypes and encoding
set fileformats=unix,dos,mac
set encoding=utf-8
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set ffs=unix,dos
autocmd VimEnter * call s:SetCursorLine()
" General behaviour
" set autochdir      " CWD is always same as current file
set ai             " Autoident
set si             " Smartident
set nowrap         " Do not wrap lines
set nocompatible   " ViM settings instead of Vi
set smartcase      " Smart casing when searching
set ignorecase     " ... or ignore casing
set hlsearch       " Highlight matches
set incsearch      " Modern (wrapping) search
set history=500    " Long undo history
set tw=1000

" make backspace a more flexible
set backspace=indent,eol,start

" Disable sounds
set vb t_vb="
set noerrorbells
set visualbell

" Tabbing, Default to 2 spaces as tabs
set cino=:0g0(0,W2
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Filetype sesific
"au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  colorscheme jellybeans

set showmatch                        " Show matching braces when over one
set ruler                            " Always show current position
set relativenumber
set number                           " Always show line-numbers
set numberwidth=5                    " Line-number margin width
set mousehide                        " Do not show mouse while typing
set antialias                        " Pretty fonts
set t_Co=256                         " 256-color palletes
set background=dark                  " Dark background variation of theme
"set t_Co=256                         " 256-color palletes
set background=dark                  " Dark background variation of theme
set guifont=Terminus:h11:cANSI
set guioptions-=T                    " TODO
set guioptions+=c                    " TODO Console messages
set linespace=0                      " Don't insert any extra pixel lines
set lazyredraw                       " Don't redraw while running macros
set wildmenu                         " Wild menu
set wildmode=longest,list,full       " Wild menu options

" Display special characters and helpers
set list
" Show < or > when characters are not displayed on the left or right.
" Also show tabs and trailing spaces.
 set list listchars=nbsp:¬,tab:--,trail:.,precedes:<,extends:>

" Statusline
" set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

" Highlight trailing whitespaces (+ keybindings below)
highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='molokai'

" Coffee

" compile on save
autocmd BufWritePost *.coffee :make! --compile

" LESS
autocmd BufWritePost *.less exe '!lessc ' . shellescape(expand('<afile>')) . ' ' . shellescape(expand('<afile>:r')) . '.css'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Auto center search
:nmap n nzz  
:nmap p pzz

let mapleader = " "  " make leader , instead of \
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" For highlighting trailing whitespaces
nnoremap <Leader>wn :match ExtraWhitespace /^\s* \s*\<Bar>\s\+$/<CR>
nnoremap <Leader>wf :match<CR>

" Disable arrows
nmap <Right> <Nop>
nmap <Left> <Nop>
nmap <Up> <Nop>
nmap <Down> <Nop>

imap <Right> <Nop>
imap <Left> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" Jump between windows
map <A-h> :wincmd h<CR>
nmap <A-l> :wincmd l<CR>
nmap <A-j> :wincmd j<CR>
nmap <A-k> :wincmd k<CR>

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
noremap <F12> :NERDTree<CR>
nnoremap <leader>ne :NERDTree<CR>
nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>nt :NERDTreeToggle <Esc>

"CtrlP (finder)
let g:ctrlp_working_path_mode = 'ra'
nmap <C-p> :CtrlP<CR>

" Less compiler
nnoremap <Leader>l :w <BAR> !lessc % > %:t:r.css<CR><space>

" Coffee
map <Leader>cj :CoffeeCompile vert <BAR> wincmd h<CR><ESC>
" ESC to clear higlight
nnoremap <silent> <esc> :noh<cr><esc>
" Saving
nnoremap <leader>w :w<cr><esc>
" Quitting
nnoremap <leader>q :q<cr><esc>
" Tab
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
map <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
imap <C-S-Tab> <ESC>:tabprevious<CR>
imap <C-Tab> <ESC>:tabnext<CR>
noremap <F7> :set expandtab!<CR>
nmap <Leader>tn :tabnew %:h<CR>
map <Leader>gt :tabnext<CR>

"Buffer operations
map <Leader>q :q<CR>
map <Leader>qa :qa<CR>
map <Leader>w :w<CR>

"Text operations
function s:make_uppercase()
  nmap <Leader>wu g~iw
endfunction
call s:make_uppercase()

"yank to clipboard+
vmap <C-c> "+y 
