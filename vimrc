"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Remap leader key
let mapleader=" "

set backspace=2     " Make backspace behave in a sane manner.
set nobackup
set nowritebackup
set noswapfile      " We don't need no stinking backups
set autowrite       " But we autosave when we change buffers
set ruler           " Display line and column numbers on the lower right
set laststatus=2    " Display always the status line
set showcmd         " Display incomplete commands
set visualbell
set noerrorbells    " Disable annoying ping
set incsearch
set number          " Show line numbers

" Switch syntax highlighting on
syntax on

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

" Don't unload buffers when they are abandoned, instead stay in the background
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

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" ----------------------------------------------------------------------
"                         Shortcuts
" ----------------------------------------------------------------------

" Zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Make handling Vim windows easier
map <leader>w- <C-W>- " smaller
map <leader>w+ <C-W>+ " larger
map <leader>w[ <C-W>= " equal
map <leader>w] <C-W>_ " fill screen

" Make splitting Vim windows easier
map <leader>; <C-W>s
map <leader>` <C-W>v

" Give a shortcut key to NERD Tree
map <leader>kb :NERDTreeToggle<CR>
