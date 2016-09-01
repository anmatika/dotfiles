set nocompatible              " be iMproved, required
filetype off                  " required
" ''''''''''''''''''''''''''''''''''''''''''''
" Vundle
" ''''''''''''''''''''''''''''''''''''''''''''
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
"Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'OrangeT/vim-csharp'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'nanotech/jellybeans.vim'
Plugin 'notpratheek/vim-luna'
Plugin 'vim-scripts/taglist.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'PProvost/vim-ps1'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'roman/golden-ratio'
Plugin 'justincampbell/vim-eighties'
Plugin 'gcmt/taboo.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'svermeulen/vim-easyclip'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ElmCast/elm-vim'
"Plugin 'lukaszkorecki/CoffeeTags'
"Plugin 'vim-scripts/TFS'
"Plugin 'ryanoasis/vim-devicons'
call vundle#end()            " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NOTES

" - don't open by "vim ." when using vim-nerdtree-tabs, instead open vim always just by typing "vim"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugin
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
set encoding=utf-8
set noswapfile
setglobal fileencoding=utf-8
  "setglobal bomb
set fileencodings=ucs-bom,utf-8,latin1
syntax on
"set paste
let g:airline_powerline_fonts=1
let g:taboo_tabline=0
let g:NERDTreeHijackNetrw=0
let g:nerdtree_tabs_open_on_gui_startup=0
" Filetypes and encoding
set fileformats=unix,dos,mac
set encoding=utf-8
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set ffs=unix,dos
" General behaviour
" set autochdir      " CWD is always same as current file
set ai             " Autoident
"set si             " Smartident
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
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set softtabstop=4
"set foldmethod=syntax
"set foldlevelstart=1
"let javaScript_fold=1         " JavaScript
" Filetype sesific
"au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
colorscheme luna

set showmatch                        " Show matching braces when over one
set ruler                            " Always show current position
set relativenumber
set number                           " Always show line-numbers
set numberwidth=5                    " Line-number margin width
set mousehide                        " Do not show mouse while typing
set antialias                        " Pretty fonts
set t_Co=256                         " 256-color palletes
set background=dark                  " Dark background variation of theme
"set guifont=Terminus:h11:cANSI
"set guifont=Monaco:h10
set guifont=Source\ Code\ Pro:h10
set guioptions-=T                    " TODO
set guioptions+=c                    " TODO Console messages
set guioptions-=e
set sessionoptions+=tabpages,globals
set linespace=0                      " Don't insert any extra pixel lines
set lazyredraw                       " Don't redraw while running macros
set wildmenu                         " Wild menu
set wildmode=longest,list,full       " Wild menu options
set timeoutlen=1000 ttimeoutlen=0
" Display special characters and helpers
set list
" Show < or > when characters are not displayed on the left or right.
" Also show tabs and trailing spaces.
set list listchars=nbsp:¬,tab:\ \ ,trail:.,precedes:<,extends:>
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
"
"set scss filetype for less, then you can beautify it by gg=G
autocmd BufNewFile,BufRead *.less set filetype=scss

" Functions
function! s:SetCursorLine()
    set cursorline
    "hi cursorline cterm=none ctermbg=darkblue ctermfg=white gui=underline
endfunction
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
function! StartMaximized()
  if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window.
    set lines=999 columns=999
  endif
endfunction
function! HideToolBarsAndScrollBars()
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endfunction
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
call HideToolBarsAndScrollBars()
call StartMaximized()

"autocmd VimEnter * call s:SetCursorLine()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1

let g:eighties_enabled = 1
let g:eighties_minimum_width = 80
let g:eighties_extra_width = 100 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra

"Golden ratio do not auto
let g:golden_ratio_autocommand = 0

" CtrlP 
" make the path vim has started as root path
let g:ctrlp_working_path_mode = 0

" vim-session
let g:session_autoload='no'

"Coffee
"get standard two-space indentation
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
"
" Coffee compile on save (we use gulp-coffee)
"autocmd BufWritePost *.coffee :silent make! --compile

" LESS compile on save (we use gulp-less)
"autocmd BufWritePost *.less exe '!lessc ' . shellescape(expand('<afile>')) . ' ' . shellescape(expand('<afile>:r')) . '.css'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_quiet_messages = { "level": "warnings" }

" Auto center search
:nnoremap n nzz
:nnoremap p pzz

"CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|bower_components|bin)$',
  \ 'file': '\v\.(exe|so|dll|generated.cs)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

"JsBeautify
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

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=["myultisnips", "UltiSnips"]
let g:UltiSnipsSnippetsDir="$HOME/antti/dotfiles/myultisnips/"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


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
let g:NERDTreeWinSize = 40
noremap <F12> :NERDTree<CR>
nnoremap <leader>ne :NERDTree<CR>
nmap <silent><Leader>nf :NERDTreeFind<CR>
nmap <silent><Leader>nt :NERDTreeToggle <Esc>

"NERDTree tabs
nnoremap <silent><leader>n :NERDTreeTabsOpen<cr>

"CtrlP (finder)
nmap <C-p> :CtrlP<CR>
nnoremap <Leader>. :CtrlPTag<CR>
" Less compiler
nnoremap <Leader>l :w <BAR> !lessc % > %:t:r.css<CR><space>

" Coffee
autocmd FileType coffee nnoremap <Leader>cc :CoffeeCompile vert <BAR> wincmd h<CR><ESC>
" ESC to clear higlight
nnoremap <silent> <esc> :noh<cr><esc>
" Saving
nnoremap <leader>w :w<cr>
" Quitting
nnoremap <leader>q :q<cr>
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
function! s:make_uppercase()
  nmap <Leader>wu g~iw
endfunction
call s:make_uppercase()

"yank to clipboard+
vmap <C-c> "+y 

" BufExplorer
nnoremap <silent> <s-F2> :BufExplorer<CR>
nnoremap <silent> <F2> :ToggleBufExplorer<CR>

"CtrlPTag
nnoremap <leader>. :CtrlPTag<cr>

"coffee 
nnoremap <silent> <leader>c :CoffeeWatch vert<cr>
"ag searcher
nnoremap <leader>f :Ag

nnoremap <leader>x :SyntasticReset<cr>

"rename under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <f5> :source ~/_vimrc<cr>

"tagbar
nnoremap <F8> :TagbarToggle<CR>

"JsBeautify
noremap <c-f> :call JsBeautify()<cr>

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

"remove ^M marks
nnoremap <leader>z :%s/\r//<cr>

"prevent entering ex mode
nnoremap Q <nop>

"beautify HTML
nnoremap <leader> bh :call beautifyHtml()<cr>
"nnoremap <silent> <c-w> :tabclose<cr>

nnoremap <silent> <leader>r :GoldenRatioResize <CR><ESC>
"
"tabclose
nnoremap <silent> <A-w> :tabclose<cr>
 "can paste many times without losing the register value
"vnoremap <silent> <expr> p <sid>Repl()

" use this with easy-clip to preserve vim default mapping for marks
"nnoremap m gm
nnoremap <silent> <F3> :<C-u>call ToggleErrors()<CR>
call SetupCommandAlias('evimrc', 'e ~/dotfiles/_vimrc')
call SetupCommandAlias('ewebdev', 'e c:/development/current/sievoweb/sievo.ppm/')
