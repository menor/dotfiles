" -----------------------------------------------------------------------------
" UI config
" -----------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

:set number " show line numbers
:set cursorline " highlight current line

:set undofile

"set italic support
highlight Comment cterm=italic

set wildmenu " visual autocomplete for command line
set showmatch " highlight matching [{()}]

" tabs = 2 spaces
:set tabstop=2
:set shiftwidth=2
:set expandtab

" enable folding
set foldenable
set foldmethod=indent
set foldlevelstart=10   " open most folds by default

" map the leader key to SPACE
let mapleader="\<SPACE>"

" -----------------------------------------------------------------------------
" Searching
" -----------------------------------------------------------------------------
set incsearch " search as characters are entered
set hlsearch " highlight matches

" turn off search highlight
nnoremap <silent><leader>c :nohlsearch<CR>

" Use the_silver_searcher for searching
let g:ackprg = 'ag --nogroup --nocolor --column'

" Enable fzf
set rtp+=/usr/local/opt/fzf

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Shortcuts for buffer navigation (from Practical Vim)
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" autoclose brackets
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

if &compatible
  set nocompatible               " Be iMproved
endif

" Setup dein Scripts-------------------------------------------------------}}}
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim')
  call dein#begin(expand('~/.config/nvim'))

  " Let dein manage dein
  call dein#add('/Users/menor/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Autocompletion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('ervandew/supertab')
  call dein#add('ternjs/tern_for_vim')
  call dein#add('carlitux/deoplete-ternjs')

  " Search
  call dein#add('Shougo/denite.nvim')
  call dein#add('mileszs/ack.vim')

  " Syntax plugins
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('othree/javascript-libraries-syntax.vim')

  " Linters and code formatters
  call dein#add('sbdchd/neoformat')

  " Color Schemes
  call dein#add('atelierbram/Base2Tone-vim')
  call dein#add('morhetz/gruvbox')

  " File & session management
  call dein#add('tpope/vim-vinegar')
  call dein#add('tpope/vim-obsession')
  call dein#add('vim-scripts/vim-auto-save')

  " Utils
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('christoomey/vim-tmux-navigator')

  " Required
  call dein#end()
  call dein#save_state()
endif

" Required
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

colorscheme gruvbox
set background=dark

" Enable jsx syntax in .js files (via mxw/vim-jsx plugin)
let g:jsx_ext_required = 0

" Highlighting for js libraries
let g:used_javascript_libs = 'lodash,react'

" enable deoplete
let g:deoplete#enable_at_startup = 1

" Neoformat settings----------------------------------------------------------

" Configure prettier
" autocmd FileType javascript setlocal formatprg=prettier\ --single-quote\ --no-semi
" let g:neoformat_try_formatprg = 1

" Make neoformat run prettier on save 
" autocmd BufWritePre *.js Neoformat

" End neoformat settings-------------------------------------------------------

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification

" Change shortcut here since it interferes with tmux move to right panel
" nnoremap <C-l> :Denite file_rec<CR>

" Configure ack.vim to be used as ag.vim (and use ag under the hood)
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
