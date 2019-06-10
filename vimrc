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
Plugin 'scrooloose/nerdtred'
Plugin 'scrooloose/syntastic'
"Plugin 'mattn/emmet-vim'
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
Plugin 'vim-scripts/taglist.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'rking/ag.vim'
Plugin 'Chun-Yang/vim-action-ag'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'
Plugin 'roman/golden-ratio'
Plugin 'justincampbell/vim-eighties'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
"Plugin 'gcmt/taboo.vim'
Plugin 'isRuslan/vim-es6'
"Plugin 'Decho'
call vundle#end()
filetype plugin indent on
syntax on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
 "Functions
function! s:SetCursorLine()
    set cursorline
    "hi cursorline cterm=none ctermbg=darkblue ctermfg=white gui=underline
endfunction

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

function! HideToolBarsAndScrollBars()
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endfunction

function! FixAlt()
  let c='a'
  while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
  endw

  set timeout ttimeoutlen=50
endfunction


fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

function! AutoReloadVimrc()
	augroup reload_vimrc " {
			autocmd!
			autocmd BufWritePost $MYVIMRC source $MYVIMRC
	augroup END " }
endfunction

function! StartMaximized()
  if has("gui_running")
     "GUI is running or is about to start.
     "Maximize gvim window.
    set lines=999 columns=999
  endif
endfunction

call FixAlt()
call AutoReloadVimrc()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
filetype plugin on
filetype indent on
syntax on

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

"Taboo
set sessionoptions+=tabpages,globals
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
set pastetoggle=<F2>
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

let g:eighties_enabled = 1
let g:eighties_minimum_width = 80
let g:eighties_extra_width = 0 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra
"
" Coffee

" compile on save
autocmd BufWritePost *.coffee silent :make! --compile

" LESS
autocmd BufWritePost *.less exe '!lessc ' . shellescape(expand('<afile>')) . ' ' . shellescape(expand('<afile>:r')) . '.css'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_quiet_messages = { "level": "warnings" }

" Auto center search
:nnoremap n nzz  
:nnoremap p pzz

"set runtimepath+=~/.vim/bundle/ultisnips

"UltiSnip
"Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=["myultisnips", "UltiSnips"]
let g:UltiSnipsSnippetsDir=["~/.dotfiles/myultisnips/"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

let g:netrw_browsex_viewer="chromium"
let mapleader = " "  " make leader , instead of \
" Don't resize automatically.
 let g:golden_ratio_autocommand = 0
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"" For highlighting trailing whitespaces
nnoremap <Leader>wn :match ExtraWhitespace /^\s* \s*\<Bar>\s\+$/<CR>
nnoremap <Leader>wf :match<CR>

"" Disable arrows
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

inoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

"" Jump between windows
noremap <A-h> :wincmd h<CR>
nnoremap <A-l> :wincmd l<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <A-k> :wincmd k<CR>

"" NERDTree
let NERDTreeMinimalUI = 1

nnoremap <Leader>F12 :NERDTree<CR>
nnoremap <leader>ne :NERDTree<CR>

"For some reason, vim registers <C-/> as <C-_>
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

nnoremap <Leader>n :NERDTreeFind<CR>
nnoremap <Leader>ft :NERDTreeToggle <Esc>

""CtrlP (finder)
let g:ctrlp_working_path_mode = 'ra'
nnoremap <C-p> :CtrlP<CR>
nnoremap <leader>. :CtrlPTag<CR>

"" Less compiler
nnoremap <Leader>l :w <BAR> !lessc % > %:t:r.css<CR><space>

"" Coffee
noremap <silent><Leader>c :CoffeeWatch vert<CR>

"Clear highlights
nnoremap <f3> :set hlsearch!<CR>
" Quitting
nnoremap <leader>q :q<cr><esc>
"" Tab
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>
noremap <F7> :set expandtab!<CR>
nnoremap <Leader>tn :tabnew %:h<CR>
noremap <Leader>gt :tabnext<CR>

"js-beautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

nnoremap <F3> :buffers<CR>:buffer<Space>
nnoremap <leader>. :CtrlPTag<cr>

"rename under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <f5> :source ~/_vimrc<cr>

"Buffer operations
noremap <Leader>q :q<CR>
noremap <Leader>qa :qa<CR>
noremap <Leader>fs :w<CR>

"Text operations
function! s:make_uppercase()
  nnoremap <Leader>wu g~iw
endfunction
call s:make_uppercase()

"yank to clipboard+
vmap <C-c> "+y 

nnoremap <silent> <F3> :BufExplorer<CR>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>
" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>
" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>

"Clear search hilight
nnoremap <silent> <Leader>/ :nohlsearch<CR>

"find and replace under cursor
nnoremap <leader>s :%s/<c-r><c-w>/

"ag searcher
nnoremap <leader>f :Ag
"tagbar
nnoremap <F8> :TagbarToggle<CR>
"hide error window
nnoremap <silent> <F3> :<C-u>call ToggleErrors()<CR>
"
"gold ratio split resize
"nnoremap <leader>r <Plug>(golden_ratio_resize)
nnoremap <leader>r :GoldenRatioResize<cr>
command! -nargs=0 Sw w !sudo tee % > /dev/null
"
"Disable ex mode
nnoremap Q <Nop>
