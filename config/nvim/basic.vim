" Remap leader key to spacebar
let mapleader=" "

set autoread                 " Updates file on external changes
set nobackup                 " Don't backup files before saving
set noswapfile               " Disable swapfiles
set visualbell               " Use visual bell instead of beeping
set number                   " Show line
set cursorline
set encoding=utf8


set nocompatible						 " Required for vim wiki
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

" Share data between vim instances (:help shada)
set shada='50,<1000,s100,h,n~/nvim/shada

augroup shada
  autocmd!
  autocmd CursorHold * rshada|wshada
augroup END

" use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vimundo/

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
" let g:nord_comment_brightness = 15
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

" === ale ===
let g:ale_linters = {'javascript': ['eslint']}

" === vim autosave ===
let g:auto_save = 1 " enable autosave on vim startup
let g:auto_save_silent = 1

" === coc ===
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver',
  \ 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

" === denite ===
nmap ; :Denite buffer -split=floating -winrow=1<CR>
" nnoremap <C-p> :<C-u>Denite file_rec<CR>
" nnoremap <leader>s :<C-u>Denite buffer<CR>
" nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
" nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
" nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>

" " use ripgrep for searching
" call denite#custom#var('file_rec', 'command',
"     \ ['rg', '--files', '--vimgrep'])

" === deoplete ===
let g:deoplete#enable_at_startup = 3

" === prettier ===
nmap <Leader>p <Plug>(Prettier)
let g:prettier#config#semi = 'false' " No semi-colons por favor
let g:prettier#config#trailing_comma = 'none'

" === ultiSnips ===
let g:UltiSnipsSnippetDirectories=[expand("$HOME/.dotfiles/snippets")]

" === vimwiki ===
let g:vimwiki_list = [
      \ {'path': '$HOME/Dropbox/Aplicaciones/vimwiki',
      \ 'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '$HOME/Dropbox/Aplicaciones/adawiki/wiki',
      \ 'syntax': 'markdown', 'ext': '.md'}]

" Fixes weird <cr> behaviour with markdown files
" https://github.com/vimwiki/vimwiki/issues/345
" let g:vimwiki_global_ext = 0
"                           keyboard shortcuts
" ------------------------------------------------------------------------------

" turn off search highlight
nnoremap <silent><leader>c :nohlsearch<CR>
