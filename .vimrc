if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" basic requirements
set nocompatible
filetype indent plugin on
syntax on
set noerrorbells

" mac specific for deleting properly
set backspace=indent,eol,start

" case insensitive searching
set ignorecase
set smartcase

" line numbers
set relativenumber
set nu

" Indentation settings
set smartindent
set shiftwidth=4
set softtabstop=4
set expandtab

" no junk files
set noswapfile
set nobackup

" autocomplete
set shortmess+=c
set complete+=kspell
set completeopt=menuone,longest

" searching
set incsearch
set nohlsearch

" scrolling
set scrolloff=8

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" devicons
set conceallevel=3
set encoding=UTF-8

" dart
let g:dart_format_on_save = 1
let g:dart_style_guide = 2

" vim-lsc
let g:lsc_auto_map = v:true

" vim lsc language server configs
" -------------------------------
let g:lsc_server_commands = {
    \ 'python': 'pyls',
    \ 'cpp': {
        \ 'command': 'clangd --background-index',
        \ 'suppress_stderr': v:true
    \},
    \ 'c': {
        \ 'command': 'clangd --background-index',
        \ 'suppress_stderr': v:true
    \},
\}
" -------------------------------

" NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '|'
"Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'itchyny/lightline.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'natebosch/vim-lsc'
    Plug 'natebosch/vim-lsc-dart'
call plug#end()

" Custom key bindings
" ---------------------------------------------------------------
" switching between splits more effectively
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h

nnoremap <C-t> :FZF<CR>

nnoremap <C-n> :NERDTree<CR>

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
" ---------------------------------------------------------------
