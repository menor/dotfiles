
" Install the dein plugin manager and creates a plugin dir if they don't exist
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

" Add the dein installation directory into the runtimepath
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/

if dein#load_state('$HOME/.config/nvim')
  call dein#begin(expand('~/.config/nvim'))

  " System 
  call dein#add('Shougo/dein.vim')                    " Let dein manage dein
  call dein#add('vim-scripts/vim-auto-save')          " Autosave
  call dein#add('christoomey/vim-tmux-navigator')     " Tmux & VIM love
  call dein#add('tpope/vim-vinegar')

  " search
  " call dein#add('Shougo/denite.nvim')

  " git
  call dein#add('tpope/vim-fugitive')

  " UI
  call dein#add('arcticicestudio/nord-vim')
 
  " Autocomplete
  call dein#add('neoclide/coc.nvim', {
    \ 'build': 'bash install.sh' 
  \ })
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  " call dein#add('w0rp/ale')
  call dein#add('mattn/emmet-vim')

  " Snippets
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')

  " Javascript
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('prettier/vim-prettier', {'build': 'yarn install'})

  " Typescript
  call dein#add('leafgarland/typescript-vim') " Typescript syntax coloring
  call dein#add('ianks/vim-tsx')              " jsx syntax coloring

  " Go
  call dein#add('fatih/vim-go', {
    \ 'build': ':GoInstallBinaries'
  \ })

  " Required
  call dein#end()
  call dein#save_state()
endif

