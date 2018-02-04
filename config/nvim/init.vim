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

" vv to generate new vertical split
" vh to generate horizontal split
nnoremap <silent> vv <C-w>v
nnoremap <silent> vh <C-w>S

" check one time after 4s of inactivity in normal mode
" so files are refreshed on outside changes
set autoread
au CursorHold * checktime

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
  call dein#add('alvan/vim-closetag')

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
  call dein#add('metakirby5/codi.vim')

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

" https://github.com/christoomey/vim-tmux-navigator/pull/165
" Disable tmux navigator whe zoomed to avoid going out of vi
let g:tmux_navigator_disable_when_zoomed=1

" Denite settings ------------------------------------------------------------------
" copied from here https://github.com/sodiumjoe/dotfiles/blob/master/vimrc

" reset 50% winheight on window resize
augroup deniteresize
  autocmd!
  autocmd VimResized,VimEnter * call denite#custom#option('default',
        \'winheight', winheight(0) / 2)
augroup end

call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })

call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git', ''])
call denite#custom#var('ag', 'command', ['rg'])
call denite#custom#var('ag', 'default_opts',
      \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('ag', 'recursive_opts', [])
call denite#custom#var('ag', 'pattern_opt', ['--regexp'])
call denite#custom#var('ag', 'separator', ['--'])
call denite#custom#var('ag', 'final_opts', [])
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
      \'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
      \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
      \'noremap')

nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

hi link deniteMatchedChar Special

" denite-extra

nnoremap <leader>o :<C-u>Denite location_list -mode=normal -no-empty<CR>
nnoremap <leader>hs :<C-u>Denite history:search -mode=normal<CR>
nnoremap <leader>hc :<C-u>Denite history:cmd -mode=normal<CR>

" Files
" Use the opening path to seach files
set path=$PWD/**

" vim-closetag configuration
" -----------------------------------------------------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" vim-closetag configuration ends
" -----------------------------------------------------------------------------
