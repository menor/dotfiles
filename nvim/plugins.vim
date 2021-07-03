" Install minpac plugin manager and creates a plugin dir if they don't exist
if (!isdirectory(expand("$HOME/.config/nvim/pack/minpac/opt")))
  call system(expand("mkdir -p $HOME/.config/nvim/pack/minpac/opt"))
  call system(expand("git clone https://github.com/k-takata/minpac.git $HOME/.config/nvim/pack/minpac/opt/minpac"))
endif

" minpac doesn't need to be loaded every time when you execute Vim.
" Unlike other plugin managers, it is needed only when updating, installing
" or cleaning the plugins.
" This is because minpac itself doesn't handle the runtime path.
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  " System 
  call minpac#add('907th/vim-auto-save')              " Autosave
  call minpac#add('christoomey/vim-tmux-navigator')   " Tmux & VIM love
  call minpac#add('tpope/vim-vinegar')

  " UI
  call minpac#add('arcticicestudio/nord-vim')

  " Basics
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-surround')

  " Telescope (Modern fuzzy finder)
  call minpac#add('nvim-lua/popup.nvim')
  call minpac#add('nvim-lua/plenary.nvim')
  call minpac#add('nvim-telescope/telescope.nvim')


endfunction

" Plugin settings here.

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" TODO: PLUGINS TO ENABLE ONE BY ONE
  " Javascript
" call minpac#add('pangloss/vim-javascript')
" call minpac#add('maxmellon/vim-jsx-pretty')
" call minpac#add('styled-components/vim-styled-components')

" Svelte
" call minpac#add('evanleck/vim-svelte')

" Typescript
" call minpac#add('leafgarland/typescript-vim')  " Typescript syntax coloring
" call minpac#add('peitalin/vim-jsx-typescript') " jsx syntax coloring


" REALLY OLD STUFF JUST FOR REFERENCE CAN BE DELETED LATER
" search
"  call dein#add('junegunn/fzf') I think is not needed since we rely in the
"  system one, remove the line once I am sure
  " call dein#add('junegunn/fzf.vim')

" Autocomplete
" call minpac#add('neoclide/coc.nvim', {
  " \ 'rev': 'release'
" \ })

" call minpac#add('w0rp/ale')
" call minpac#add('mattn/emmet-vim')
" call minpac#add('jiangmiao/auto-pairs')

" Snippets
" call dein#add('sirver/ultisnips')
" call dein#add('honza/vim-snippets')

" Golang
" call dein#add('fatih/vim-go', {
  " \ 'build': ':GoInstallBinaries'
" \ })
" call dein#add('sebdah/vim-delve')

" Utils
" call dein#add('vimwiki/vimwiki')
" call dein#add('tpope/vim-fugitive')
