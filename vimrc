"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Remap leader key
let mapleader=" "

set autoread        " Updates file on external changes
set backspace=2     " Make backspace behave in a sane manner.
set nobackup
set nowritebackup
set noswapfile      " We don't need no stinkin backups
set autowrite       " But we autosave when we change buffers
set ruler           " Display line and column numbers on the lower right
set laststatus=2    " Display always the status line
set showcmd         " Display incomplete commands
set visualbell
set noerrorbells    " Disable annoying ping
set incsearch
set number          " Show line numbers
set nrformats=      " Treat all numbers as decimals


" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:· 

set hls             " Switch search highlighting on
syntax on           " Switch syntax highlighting on
:au FocusLost * :wa " Autosave on focus lost

" Load plugins fom external file
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" Don't unload buffers when they are abandoned, instead stay in the background
set hidden

" Configure indentation
set expandtab
set shiftwidth=2
set tabstop=2

" Configure gruvbox color scheme
colorscheme gruvbox
set background=dark    " Setting dark mode

" enable italics
highlight Comment cterm=italic

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects  .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

endif

" CtrlP includes untracked files and honours the .gitignore
unlet g:ctrlp_user_command
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

" Configure Airine
" Make airline show the open buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Use powerline fonts
let g:airline_powerline_fonts = 1

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Activates tern shortcuts http://usevim.com/2013/05/24/tern/ 
let g:tern_map_keys=1
"show argument hints for tern
let g:tern_show_argument_hints='on_hold'

" Configure syntastic
" Use https://github.com/feross/standard config
" Needs to run npm i -g standard to install standard first
let g:syntastic_javascript_checkers = ['standard']

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

" Moving through buffers, inspired by unimpaired.vim plugin
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Mute search highlighting when we redraw the screen
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Shortcuts for editing files in dir
" for more info check http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Plugins shortcuts 
map <leader>kb :NERDTreeToggle<CR>
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Remap arrows to silver searcher
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>
" Index ctags from any project
map <Leader>ct :!ctags -R --exclude=node_modules --exclude='*\.min\.*' --exclude=bower_components .<CR>

