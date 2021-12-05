----------------------------------- plugins -----------------------------------

-- we use Paq as a package manager since it is written in Lua
-- we need to install it first https://github.com/savq/paq-nvim 
-- you can run :PaqSync to install, clean and update packages in one go
-- Bootstrap Paq when needed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
end

require 'paq' {
  'pocco81/autosave.nvim',
  'christoomey/vim-tmux-navigator',   -- tmux & vim love
  'tpope/vim-vinegar',
  'tpope/vim-commentary',
  'tpope/vim-surround',

  'nathom/filetype.nvim', -- speed up nvim initialization

  -- fuzy finding
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',

  -- UI
  'arcticicestudio/nord-vim',

  -- CSS
  'norcalli/nvim-colorizer.lua',

  -- autocompletion
  'neovim/nvim-lspconfig', -- includes configs for most language servers
  {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'},
  "windwp/nvim-ts-autotag", -- autoclose html tags using treesitter

  -- cmp is what handles the autocompletion, it uses neovim lsp
  -- underneath to accomplish that.
  'hrsh7th/nvim-cmp',
  -- below are the completion sources for nvim-cmp
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',

  -- 'windwp/nvim-autopairs',
}


