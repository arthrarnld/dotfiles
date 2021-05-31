" =========================================================
" Plugin section
" =========================================================

call plug#begin(stdpath('data') . '/plugged')

" Visuals
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
" Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'pest-parser/pest.vim'
" Misc
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()


" =========================================================
" General
" =========================================================

" Leader key
let mapleader = "\<Space>"

set ignorecase
set smartcase
nnoremap <Enter> @@

" Colours and theme
set termguicolors
let g:gruvbox_contrast_dark='soft'
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" Tabs
set expandtab
set tabstop=4
set shiftwidth=4
autocmd FileType javascript,typescript set tabstop=2 | set shiftwidth=2

" Buffers
nnoremap <leader><leader> <c-^>
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
nnoremap <leader>; :buffers<CR>
set autoread

" Windows
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l
nmap <silent> <C-h> <C-w>h
set splitbelow
set splitright

" File searching
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --glob !vendor/ --glob !node_modules/ --files --color=never --glob ""'
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRUFiles'

" Line/column highlight
set cursorline
set cursorcolumn

" Clear search highlight
nnoremap <silent> <esc> :noh<CR>

" Line numbers
set nu rnu
" Scoll padding
set scrolloff=3
" Allow changed buffers to go to background
set hidden
" Disable preview window
set completeopt-=preview


" =========================================================
" Lightline
" =========================================================

set noshowmode
let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'filename': 'LightlineFilename',
            \   'cocstatus': 'coc#status',
            \ },
            \ }

function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


" =========================================================
" CoC
" =========================================================

" TAB triggers suggestions and cycles through them
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-.> coc#refresh()

" Code navigation
" `- [d]efinition
nmap <silent> gd <Plug>(coc-definition)
" `- t[y]pe definition
nmap <silent> gy <Plug>(coc-type-definition)
" `- [i]mplementation
nmap <silent> gi <Plug>(coc-implementation)
" `- [r]eferences
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol and its references
autocmd CursorHold * silent call CocActionAsync('highlight')

" Cycle through diagnostics
nmap <silent> gj <Plug>(coc-diagnostic-next)
nmap <silent> gk <Plug>(coc-diagnostic-prev)

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Function text object
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Find symbol of current document
nnoremap <silent> <leader>o :<C-u>CocList outline<CR>

" Search workspace symbols
nnoremap <silent> <leader>s :<C-u>CocList -I symbols<CR>

" Go to next occurence of most recent list
nnoremap <silent> <leader>n :<C-u>CocNext<CR>

" Implement methods for trait
nnoremap <silent> <leader>i :call CocActionAsync('codeAction', '', 'Implement missing members')<CR>

" Show available actions at current location
nnoremap <silent> <leader>a :CocAction<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

filetype plugin indent on
syntax enable

set updatetime=300
" 
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" =========================================================
" Rust
" =========================================================

au FileType rust source ~/.config/nvim/scripts/spacetab.vim
au FileType rust set colorcolumn=100

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
