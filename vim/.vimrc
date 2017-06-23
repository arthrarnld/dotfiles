set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'Yggdroot/indentLine'
Plugin 'fidian/hexmode'

call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically reload a file
" when it changes
set autoread

" Read config files from current directory
set exrc
" But be secure
set secure

set backspace=indent,eol,start


""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""

" Display line numbers
set number
set relativenumber

" Set scrolloff so lines are visible
" below/above the cursor
set so=7

" Turn on WiLd menu
set wildmenu

" Have it ignore compiled files
set wildignore=*.o,*~,*.pyc

" Show the current position
set ruler

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" Use smartcase for searching
set smartcase

" Highlight search results
set hlsearch

" Show matching brackets
set showmatch
" Blink matching brackets for
" this many tenths of a second
set mat=1


""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlight
syntax enable

set background=dark
colorscheme material

" Always use UTF8 encoding
set encoding=utf8

" Set line number column background
hi LineNr ctermfg=245 ctermbg=NONE


""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, Tabs and Indent
""""""""""""""""""""""""""""""""""""""""""""""""""

" Use smart tabs
set smarttab

set autoindent
set smartindent
set wrap
set cinoptions+=g0

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2

set statusline=\ %f%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ %l,%c


""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>av :tabnew $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

nnoremap <C-c> :bn<bar>bd #<CR>

nnoremap <C-k> O<Esc>j
nnoremap <C-j> o<Esc>k
inoremap <C-k> <Esc>O
inoremap <C-j> <Esc>o

nnoremap m :nohl<CR>

" Tabs
nnoremap <leader>tn :tabnew<Space>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprev<CR>
nnoremap <leader>tk :tabfirst<CR>
nnoremap <leader>tj :tablast<CR>

" Windows
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wl :wincmd l<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Always show hidden files
let NERDTreeShowHidden=1
" Auto open
autocmd VimEnter * NERDTree | wincmd p
" Auto open when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd h | endif
" Auto-open if a directory is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exec 'cd '.argv(0) | NERDTree | wincmd p | ene | wincmd p | endif
" Auto-close vim if NERDTree is the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
""""""""""""""""""""""""""""""""""""""""""""""""""

let ycm_confirm_extra_conf=0
