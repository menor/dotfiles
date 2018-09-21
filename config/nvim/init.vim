" === === === === === === === === === === === === === === === === === === ===
"                             UI configuration
" === === === === === === === === === === === === === === === === === === ===

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set number " show line numbers
" :set cursorline " highlight current line disabled cause it slows things down

set undofile

" Not needed anymore, but vimwiki needs it for the links to work properly
filetype plugin on

" Required
syntax enable

"set italic support
highlight Comment cterm=italic

set showmatch " highlight matching [{()}]
set termguicolors

" tabs = 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" enable folding
set foldenable
set foldmethod=syntax
set foldlevelstart=10   " open most folds by default

" check one time after 4s of inactivity in normal mode
" so files are refreshed on outside changes
set autoread
au CursorHold * checktime

" Share data between vim instances (:help shada)
set shada='50,<1000,s100,h,n~/nvim/shada

augroup shada
  autocmd!
  autocmd CursorHold * rshada|wshada
augroup END

" === === === === === === === === === === === === === === === === === === ===
"                   Key Bindings (except for plugins)
" === === === === === === === === === === === === === === === === === === ===

let mapleader="\<SPACE>"

" === panels ===
nnoremap <silent> vv <C-w>v  " new vertical split
nnoremap <silent> vh <C-w>S  " new horizontal split

" === buffers ===
nnoremap <Leader><Leader> <c-^> " Switch between the last two files

" === autoclose brackets ===
" ino " ""<left>
" ino ' ''<left>
" ino ( ()<left>
" ino [ []<left>
ino {<CR> {<CR>}<ESC>O<tab>
ino {,<CR> {<CR>},<ESC>O<tab>
" ino {;<CR> {<CR>};<ESC>O\<tab>

nnoremap <silent><leader>c :nohlsearch<CR> " turn off search highlight

" === search & replace ===
" Make & trigger the :&& command so it preserves flags and create a visual
" equivalent, see Pracitcal Vim tip 93
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" === edit configs ===
nnoremap <leader>, :vsp $MYVIMRC<CR>
nnoremap <leader>,z :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" === === === === === === === === === === === === === === === === === === ===
"                                 Searching
" === === === === === === === === === === === === === === === === === === ===

set incsearch " search as characters are entered
set hlsearch " highlight matches

" Use the_silver_searcher for searching
let g:ackprg = 'ag --nogroup --nocolor --column'

" Enable fzf
set rtp+=/usr/local/opt/fzf

" === === === === === === === === === === === === === === === === === === ===
"                                 Plugins
" === === === === === === === === === === === === === === === === === === ===

" === dein setup ===

if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim')
  call dein#begin(expand('~/.config/nvim'))

  " Let dein manage dein
  call dein#add('$HOME/.config/nvim/repos/github.com/Shougo/dein.vim')

  " Autocompletion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('ervandew/supertab')
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('ternjs/tern_for_vim')
  call dein#add('alvan/vim-closetag')
  call dein#add('tpope/vim-commentary')

  " Search
  call dein#add('Shougo/denite.nvim')
  call dein#add('mileszs/ack.vim')
  call dein#add('bronson/vim-visual-star-search')

  " Syntax plugins
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('styled-components/vim-styled-components')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('elixir-editors/vim-elixir')
  call dein#add('elmcast/elm-vim')
  call dein#add('pbogut/deoplete-elm')
  call dein#add('digitaltoad/vim-pug')
  " call dein#add('Shougo/neosnippet.vim')
  call dein#add('reasonml-editor/vim-reason-plus')
  call dein#add('rust-lang/rust.vim')
  call dein#add('fatih/vim-go')

  " Linters and code formatters
  call dein#add('w0rp/ale')
  call dein#add('sbdchd/neoformat')
  call dein#add('prettier/vim-prettier')

  " Color Schemes & Interface enhancers
  call dein#add('atelierbram/Base2Tone-vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " File & session management
  call dein#add('tpope/vim-vinegar')
  call dein#add('tpope/vim-obsession')
  call dein#add('dhruvasagar/vim-prosession')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-scripts/vim-auto-save')

  " Utils
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('metakirby5/codi.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('vimwiki/vimwiki')
  call dein#add('sjl/gundo.vim')

  " Required
  call dein#end()
  call dein#save_state()
endif

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" === === === === === === === === === === === === === === === === === === ===
"                           Plugins configuration
" === === === === === === === === === === === === === === === === === === ===

" === theme config ===

" nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1

colorscheme nord

" === gundo ===
let g:gundo_prefer_python3 = 1 " makes it work with neovim
let g:gundo_close_on_revert = 1
nnoremap <leader>u :GundoToggle<CR> " super undo

" === emmet ===
let g:user_emmet_settings = {'javascript.jsx' : {'extends' : 'jsx',}}

" Enable jsx syntax in .js files (via mxw/vim-jsx plugin)
let g:jsx_ext_required = 0

" Highlighting for js libraries
let g:used_javascript_libs = 'lodash,react'

" enable deoplete
let g:deoplete#enable_at_startup = 1

" Neoformat settings----------------------------------------------------------

" Configure prettier
" augroup prettier
  " autocmd FileType javascript setlocal formatprg=prettier\ --single-quote\ --no-semi
  " let g:neoformat_try_formatprg = 1

" Make neoformat run prettier on save 
" This should be changed to run on staged files
"  autocmd BufWritePre *.js Neoformat
" augroup end

" End neoformat settings-------------------------------------------------------

" === prettier ===
nmap <Leader>p <Plug>(Prettier)
let g:prettier#config#semi = 'false' " No semi-colons por favor

" === rust.vim ===
nnoremap <Leader>f :RustFmt<CR>

" === elm ===

" === ale ===
let g:ale_linters = {'js': ['stylelint', 'eslint']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'

" === vim auto save ===
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification


" === vim-visual-star-search ===
" use ag for recursive searching so we don't find 10,000 useless hits inside node_modules
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<CR>
vnoremap <leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call ag#Ag('ag', '--literal ' . shellescape(@/))<CR>

" Change shortcut here since it interferes with tmux move to right panel
nnoremap <C-i> :Denite file_rec<CR>

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

" Fixes highlights not visible when using the nord theme
" https://github.com/arcticicestudio/nord-vim/issues/79#issuecomment-348974334

call denite#custom#option('default', 'highlight_matched_char', 'PreProc')
call denite#custom#option('default', 'highlight_matched_range', 'Comment')

call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', ''])
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

" === vimwiki ===
let g:vimwiki_list = [{'path': '$HOME/Dropbox/Aplicaciones/vimwiki', 'syntax': 'markdown', 'ext': '.md'},{'path': '$HOME/Dropbox/Aplicaciones/adawiki/wiki', 'syntax': 'markdown', 'ext': '.md'}]

" Fixes weird <cr> behaviour with markdown files
" https://github.com/vimwiki/vimwiki/issues/345
let g:vimwiki_global_ext = 0

" === airline ===
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_inactive_collapse=1 " Show only filename in inactive windows

" airline loads by default all the extensions available,
" this changes this behaviour to opt-in 
let g:airline_extensions = ['branch', 'tabline']

let g:airline_section_y = '' " disable fileencoding section
let g:airline_powerline_fonts = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" === vim javascript ===
let g:javascript_plugin_flow = 1 " enable flow syntax

" === codi ===
let g:codi#rightsplit=0
let g:codi#rightalign=0

" === vim reason plus ===
" Needs npm i -g ocaml-language-server
let g:LanguageClient_serverCommands = {
  \ 'reason': ['ocaml-language-server', '--stdio'],
  \ 'ocaml': ['ocaml-language-server', '--stdio']
  \ }

" === Vim-Markdown ===
au BufNewFile,BufFilePre,BufReadPost,BufRead *.md set filetype=markdown

" Highlight Javascript code in markdown
let g:markdown_fenced_languages = ['javascript']

" Spell check
setlocal spell spelllang=en_us
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
