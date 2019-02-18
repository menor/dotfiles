" Installs the dein plugin manager if it's not there yet
" https://github.com/Shougo/dein.vim

let neovim_dir='$HOME/.config/nvim'
let dein_dir=neovim_dir + 'repos/github.com/Shougo/dein.vim'

" Add the dein installation directory into the runtimepath
set runtimepath+=dein_dir

if dein#load_state(neovim_dir)
  call dein#begin(expand(neovim_dir))

  " Let dein manage dein
  call dein#add(dein_dir)
endif
