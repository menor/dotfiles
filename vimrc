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
Plugin 'kien/ctrlp.vim'

" Color Schemes
Plugin 'morhetz/gruvbox'

" All of your plugins must be added before this line
call vundle#end()

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on
" To ignore plugin indent changes, instead use
" filetype plugin on

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

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Configure indentation
set expandtab
set shiftwidth=2
set shiftwidth=2

colorscheme gruvbox
" enable italics
highlight Comment cterm=italic

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

