set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
"Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'fidian/hexmode'
Plugin 'valloric/youcompleteme'
"Plugin 'Rip-Rip/clang_complete'

call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically reload a file
" when it changes
set autoread

" Read config files from current directory
set exrc
" But be secure
set secure

set backspace=indent,eol,start

set conceallevel=0

autocmd FileType * set formatoptions-=ro

set breakindent


""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
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

"set cursorline


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

"set statusline=\ %f%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ %l,%c


""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Open .vimrc
nnoremap <leader>av :tabnew $MYVIMRC<CR>
" Source .vimrc
nnoremap <leader>rv :source $MYVIMRC<CR>

function! CloseBuffer()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    ene
  else
    bn
  endif
  bd #
endfunction

" Close current buffer
nnoremap <C-c> :call CloseBuffer()<CR>
command! W :w | :call CloseBuffer()

" Inserting blank lines
nnoremap <C-k> O<Esc>j
nnoremap <C-j> o<Esc>k
inoremap <C-k> <Esc>O
inoremap <C-j> <Esc>o

" Hide highlighting
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

" Format JSON
nnoremap <leader>fj :%!python -m json.tool<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" C++ snippets
""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <leader>csr const std::string&<Space>
inoremap <leader>s std::string<Space>


""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Always show hidden files
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=0
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

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nnoremap <leader>yr :YcmRestartServer<CR>
nnoremap <leader>yd :YcmDebugInfo<CR>
nnoremap <leader>yc :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
