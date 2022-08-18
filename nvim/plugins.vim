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
  call dein#add('Shougo/dein.vim')                  " Let dein manage dein
  call dein#add('907th/vim-auto-save')              " Autosave
  call dein#add('christoomey/vim-tmux-navigator')   " Tmux & VIM love
  call dein#add('tpope/vim-vinegar')

  " search
"  call dein#add('junegunn/fzf') I think is not needed since we rely in the
"  system one, remove the line once I am sure
  call dein#add('junegunn/fzf.vim')

  " UI
  call dein#add('arcticicestudio/nord-vim')
 
  " Autocomplete
  call dein#add('neoclide/coc.nvim', {
    \ 'build': 'install.sh',
    \ 'merge':0,
    \ 'rev': 'release'
  \ })

  call dein#add('tpope/vim-commentary')
 " call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-surround')
  " call dein#add('w0rp/ale')
  call dein#add('mattn/emmet-vim')
  call dein#add('jiangmiao/auto-pairs')

  " Snippets
  call dein#add('sirver/ultisnips')
  call dein#add('honza/vim-snippets')

  " Javascript
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('prettier/vim-prettier', {'build': 'yarn install'})
  call dein#add('styled-components/vim-styled-components')

  " Typescript
  call dein#add('leafgarland/typescript-vim')  " Typescript syntax coloring
  call dein#add('peitalin/vim-jsx-typescript') " jsx syntax coloring
  " call dein#add('ianks/vim-tsx')               " jsx syntax coloring

  " Golang
  call dein#add('fatih/vim-go', {
    \ 'build': ':GoInstallBinaries'
  \ })
  call dein#add('sebdah/vim-delve')

  " Utils
  call dein#add('vimwiki/vimwiki')
  call dein#add('tpope/vim-fugitive')

  " Required
  call dein#end()
  call dein#save_state()
endif

