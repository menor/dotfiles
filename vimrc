"  TODO
"  https://github.com/geekjuice/vim-mocha

"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Remap leader key
let mapleader=" "

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Show line numbers
set number

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

  filetype plugin indent on
" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside vim
set autoread 

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Configure indentation
set expandtab
set shiftwidth=2
set tabstop=2

" Configure Gruvbox color scheme
colorscheme gruvbox
set background=dark    " Setting dark mode

" enable italics
highlight Comment cterm=italic

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" ----------------------------------------------------------------------
"                         Shortcuts
" ----------------------------------------------------------------------

" Make handling Vim windows easier
map <leader>w- <C-W>- " smaller
map <leader>w+ <C-W>+ " larger
map <leader>w[ <C-W>= " equal
map <leader>w] <C-W>_ " fill screen

" Make splitting Vim windows easier
map <leader>; <C-W>s
map <leader>` <C-W>v

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
