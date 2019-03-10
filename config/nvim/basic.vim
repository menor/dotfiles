" Remap leader key to spacebar
let mapleader=" "

set autoread                 " Updates file on external changes
set nobackup                 " Don't backup files before saving
set noswapfile               " Disable swapfiles
set visualbell               " Use visual bell instead of beeping
set number                   " Show line
set cursorline

syntax on                    " Switch syntax highlighting on
filetype indent plugin on    " Load filetype plugin automatically

" Configure indentation tabs = 2 spaces
set expandtab
set shiftwidth=2
set tabstop=2

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Programs to use for evaluating Python code
" Setting this here makes startup faster
let g:python_host_prog  = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Check file after 4 secs of inactivity in normal mode,
" so files are refreshed on outside changes
set autoread
au CursorHold * checktime

set foldmethod=indent

" ------------------------------------------------------------------------------
"                               plugins
" ------------------------------------------------------------------------------

" Load plugins from external file
if filereadable(expand("$HOME/.config/nvim/plugins.vim"))
  source $HOME/.config/nvim/plugins.vim
endif


" ------------------------------------------------------------------------------
"                           language server
" ------------------------------------------------------------------------------

" Automatically start language servers
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" ------------------------------------------------------------------------------
"                             theme config
" ------------------------------------------------------------------------------

" nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
set termguicolors " Needed for the comment brightness to work
let g:nord_comment_brightness = 15
let g:nord_uniform_diff_background = 1

" https://github.com/arcticicestudio/nord-vim/issues/36#issuecomment-315519950
augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight Folded gui=bold,italic guibg=#3B4252 guifg=#616E88
augroup end

colorscheme nord

" ------------------------------------------------------------------------------
"                             plugin config
" ------------------------------------------------------------------------------

" === vim autosave ===
let g:auto_save = 1 " enable autosave on vim startup
let g:auto_save_silent = 1

" === deoplete ===
let g:deoplete#enable_at_startup = 1

" === prettier ===
nmap <Leader>p <Plug>(Prettier)
let g:prettier#config#semi = 'false' " No semi-colons por favor
let g:prettier#config#trailing_comma = 'none'
