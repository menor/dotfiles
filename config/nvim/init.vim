let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" tabs = 2 spaces
:set tabstop=2
:set shiftwidth=2
:set expandtab

" Map the leader key to SPACE
let mapleader="\<SPACE>"

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

  " Syntax plugins
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('othree/javascript-libraries-syntax.vim')

  " Linters and code formatters
  call dein#add('w0rp/ale')
  call dein#add('sbdchd/neoformat')

  " Color Schemes
  call dein#add('atelierbram/Base2Tone-vim')
  call dein#add('morhetz/gruvbox')

  " Session Management
  call dein#add('thaerkh/vim-workspace')

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

"set italic support
highlight Comment cterm=italic

" Enable jsx syntax in .js files (via mxw/vim-jsx plugin)
let g:jsx_ext_required = 0

" Highlighting for js libraries
let g:used_javascript_libs = 'underscore,react'

" enable deoplete
let g:deoplete#enable_at_startup = 1

" Ale config
" let g:ale_sign_column_always = 1

" Javascript settings for neoformat
" Configure prettier
autocmd FileType javascript setlocal formatprg=prettier\ --single-quote\ --no-semi
let g:neoformat_try_formatprg = 1

" Make neoformat run prettier on save and on leaving insert mode
autocmd BufWritePre,InsertLeave *.js Neoformat

" remap workspace to leader s
nnoremap <leader>s :ToggleWorkspace<CR>

" enable autosave even when outside a session
let g:workspace_autosave_always = 1

