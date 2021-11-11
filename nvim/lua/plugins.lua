----------------------------------- plugins -----------------------------------

-- we use Paq as a package manager since it is written in Lua
-- we need to install it first https://github.com/savq/paq-nvim 
-- you can run :PaqSync to install, clean and update packages in one go
require 'paq-nvim' {
  'savq/paq-nvim',
  -- '907th/vim-auto-save',
  'pocco81/autosave.nvim',
  'christoomey/vim-tmux-navigator',   -- tmux & vim love
  'tpope/vim-vinegar',
  'tpope/vim-commentary',
  'tpope/vim-surround',

  -- fuzy finding
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',

  -- for improved syntax highlighting, for how to install language parsers
  -- check https://github.com/nvim-treesitter/nvim-treesitter#language-parsers
  -- "nvim-treesitter/nvim-treesitter",

  -- UI
  'arcticicestudio/nord-vim',

  -- autocompletion
  'neovim/nvim-lspconfig', -- includes configs for most language servers

  -- cmp is what handles the autocompletion, it uses neovim lsp
  -- underneath to accomplish that.
  -- 'hrsh7th/nvim-cmp',
  -- below are the completion sources for nvim-cmp
  -- 'hrsh7th/cmp-nvim-lsp',
  -- 'hrsh7th/cmp-buffer',
  -- 'hrsh7th/cmp-path',

  -- 'windwp/nvim-autopairs',
}


