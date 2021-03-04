" ---------------------Plugs--------------------------
" vim-plug
call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'preservim/nerdtree'
    Plug 'instant-markdown/vim-instant-markdown', {'for' : 'markdown'}
    Plug 'itchyny/lightline.vim'
    Plug 'dense-analysis/ale'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'tmsvg/pear-tree'
    Plug 'voldikss/vim-floaterm'
    Plug 'gruvbox-community/gruvbox'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" colorscheme
colorscheme gruvbox

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
" NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '|'
"Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" floaterm
let g:floaterm_keymap_toggle = '<Leader><CR>' " leader is usually '\'
let g:floaterm_keymap_kill = '<Leader><BS>'

" linting
let g:ale_detail_to_floating_preview = 1 
let g:go_metalinter_autosave = 1

" markdown
let g:instant_markdown_autostart = 0 
nnoremap <C-m><CR> :InstantMarkdownPreview<CR>
nnoremap <C-m><BS> :InstantMarkdownStop<CR>

" ------------------Settings -------------------------------------

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
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
set shortmess+=c
set complete+=kspell
set completeopt=menuone,longest,noinsert,noselect
autocmd CompleteDone * if !pumvisible() | pclose | endif

" searching
set incsearch
set nohlsearch

" scrolling
set scrolloff=8

" ----------------Custom key bindings-----------------------------
" switching between splits more effectively
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
" Plug command bindings 
nnoremap <C-Space> :NERDTreeToggle<CR>
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
" ----------------------------------------------------------------
