
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
  call dein#add('tpope/vim-vinegar')     " Tmux & VIM love

  " UI
  call dein#add('arcticicestudio/nord-vim')
 

  " Autocomplete
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tpope/vim-commentary')


  " Javascript
  call dein#add('pangloss/vim-javascript')
  " Plugin to register the javascript-language-server autonmatically
  call dein#add('ryanolsonx/vim-lsp-javascript')
  " call dein#add('carlitux/deoplete-ternjs')
  " call dein#add('ternjs/tern_for_vim', {'build': 'npm install -g tern'})

  " Typescript
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
  " Using nvim-typescript instead of the commented out code down here, it
  " still didn't work well in Jan 19 but keeping an eye on the language 
  " client implementation in the future
    " Language client
    call dein#add('autozimu/LanguageClient-neovim',{
      \ 'rev': 'next',
      \ 'build': 'install.sh'
    \ })

    " Plugin to register the typescript-language-server autonmatically
    " See https://github.com/prabirshrestha/vim-lsp/wiki/Servers-TypeScript
    call dein#add('ryanolsonx/vim-lsp-typescript')

  " Required
  call dein#end()
  call dein#save_state()
endif

