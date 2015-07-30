" Automatically reload a file
" when it changes
set autoread

" Read config files from current directory
set exrc
" But be secure
set secure


""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""

" Display line numbers
set number

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
set mat=2


""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlight
syntax enable

set background=dark
colorscheme desert

" Always use UTF8 encoding
set encoding=utf8

" Set line number column background
" hi LineNr cterm=NONE ctermbg=darkyellow


""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, Tabs and Indent
""""""""""""""""""""""""""""""""""""""""""""""""""

" Use smart tabs
set smarttab

set autoindent
set smartindent
set wrap

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab


""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2

set statusline=\ %f%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ %l,%c

