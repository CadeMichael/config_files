" This vimrc uses Kite for python and Vim-LSC for Dart & C/C++

" vim-plug
call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'junegunn/fzf'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'natebosch/vim-lsc'
    Plug 'natebosch/vim-lsc-dart'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'Neevash/awesome-flutter-snippets'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'microsoft/vscode-python'
    Plug 'tmsvg/pear-tree'
    Plug 'gruvbox-community/gruvbox'
    Plug 'voldikss/vim-floaterm'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
    Plug 'preservim/tagbar'
call plug#end()

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'monokai_pro',
      \ }

" devicons
set conceallevel=3
set encoding=UTF-8

" dart
let g:dart_format_on_save = 1
let g:dart_style_guide = 2

" vim-lsc
let g:lsc_auto_map = v:true

" -------------------------------
let g:kite_supported_languages = ['python']
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
"autocmd FileType dart
"	\ call deoplete#custom#buffer_option('auto_complete', v:false)
autocmd FileType c
	\ call deoplete#custom#buffer_option('auto_complete', v:false)
autocmd FileType cpp
	\ call deoplete#custom#buffer_option('auto_complete', v:false)
autocmd FileType python
	\ call deoplete#custom#buffer_option('auto_complete', v:false)
let g:lsc_server_commands = {
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

" floaterm
let g:floaterm_keymap_toggle = '<Leader><CR>' " leader is usually '\'
let g:floaterm_keymap_kill = '<Leader><BS>'

" pairing
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ '"': {'closer': '"'}
            \ }
 
" markdown --sudo npm -g install instant-markdown-d@next--
let g:instant_markdown_autostart = 0

" vim color theme
"colorscheme gruvbox 
set termguicolors
colorscheme monokai_pro 

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
set completeopt=menuone,longest,noselect,noinsert
autocmd CompleteDone * if !pumvisible() | pclose | endif

" searching
set incsearch
set nohlsearch

" scrolling
set scrolloff=8

" Custom key bindings
" ---------------------------------------------------------------
" switching between splits more effectively
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
" Plug bindings 
nnoremap <C-t> :FZF<CR>
nnoremap <C-Space> :NERDTreeToggle<CR>
nnoremap <C-m><CR> :InstantMarkdownPreview<CR>
nnoremap <C-m><BS> :InstantMarkdownStop<CR>
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
nnoremap <Space>t :TagbarToggle<CR>
" ---------------------------------------------------------------
