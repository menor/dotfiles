" Install minpac plugin manager and creates a plugin dir if they don't exist
if (!isdirectory(expand("$HOME/.config/nvim/pack/minpac/opt")))
  call system(expand("mkdir -p $HOME/.config/nvim/pack/minpac/opt"))
  call system(expand("git clone https://github.com/k-takata/minpac.git $HOME/.config/nvim/pack/minpac/opt/minpac"))
endif

packadd minpac
call minpac#init()

" System 
call minpac#add('907th/vim-auto-save')              " Autosave
call minpac#add('christoomey/vim-tmux-navigator')   " Tmux & VIM love
call minpac#add('tpope/vim-vinegar')

" search
"  call dein#add('junegunn/fzf') I think is not needed since we rely in the
"  system one, remove the line once I am sure
  " call dein#add('junegunn/fzf.vim')

" UI
call minpac#add('arcticicestudio/nord-vim')
 
" Autocomplete
call minpac#add('neoclide/coc.nvim', {
  \ 'rev': 'release'
\ })

call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
" call minpac#add('w0rp/ale')
" call minpac#add('mattn/emmet-vim')
" call minpac#add('jiangmiao/auto-pairs')

" Snippets
" call dein#add('sirver/ultisnips')
" call dein#add('honza/vim-snippets')

  " Javascript
call minpac#add('pangloss/vim-javascript')
call minpac#add('maxmellon/vim-jsx-pretty')
" call minpac#add('prettier/vim-prettier', {'do': 'yarn install'})
call minpac#add('styled-components/vim-styled-components')

" Svelte
call minpac#add('evanleck/vim-svelte')

" Typescript
call minpac#add('leafgarland/typescript-vim')  " Typescript syntax coloring
call minpac#add('peitalin/vim-jsx-typescript') " jsx syntax coloring

" Golang
" call dein#add('fatih/vim-go', {
  " \ 'build': ':GoInstallBinaries'
" \ })
" call dein#add('sebdah/vim-delve')

" Utils
" call dein#add('vimwiki/vimwiki')
" call dein#add('tpope/vim-fugitive')
