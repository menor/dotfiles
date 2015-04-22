"  TODO
"  https://github.com/geekjuice/vim-mocha

"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Remap leader key
let mapleader=" "

" ----------------------------------------------------------------------
"                            Vundle Stuff
" ----------------------------------------------------------------------

" required for Vundle to work
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'marijnh/tern_for_vim'
  " Provides tern based JS editing support
  " Tern needs node & npm for it to work
  " cd ~/.vim/bundle/tern_for_vim && npm install

Plugin 'pangloss/vim-javascript' " JS syntax and indent plugins
Plugin 'wookiehangover/jshint' " Javascript Hint
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree' " File tree
Plugin 'bling/vim-airline' " Status bar

" Used to integrate tmux and vim navigation.
Bundle 'christoomey/vim-tmux-navigator'

" Vim Tmux runner, to launch programs from vim.
Bundle 'christoomey/vim-tmux-runner'

" Color Schemes
Plugin 'morhetz/gruvbox'

" All of your plugins must be added before this line
call vundle#end()

" Brief Vundle Help
" -----------------------------------------------------------------------
" :PluginList        - lists configured plugins.
" :PluginInstall     - append ! to update or just :PluginUpdate.
" :PluginSearch foo  - searches for foo; append ! to refresh local cache.
" :PluginClean       - confirms removal of unused plugins; ! to auto aprov.

" see :h vundle for more help.

" ----------------------------------------------------------------------
"                         Vundle Stuff Ends
" ----------------------------------------------------------------------

" Switch syntax highlighting on
syntax on

" Show line numbers
set number

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

" autosave on loosing focus
" see http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost
:au FocusLost * :wa

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
