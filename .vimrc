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

" vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
  Plug 'vim-scripts/AutoComplPop'
  Plug 'preservim/nerdtree'
call plug#end()

" Custom key bindings
nnoremap <C-t> :FZF<CR>

nnoremap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '|'

"Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
