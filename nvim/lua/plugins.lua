-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use({
      'wbthomason/packer.nvim',
      config = get_setup('packer')
    })

    -- Helpers
    use({
      'pocco81/autosave.nvim',
      config = get_setup('autosave')
    })

   -- UI
   use({
      'shaunsingh/nord.nvim',
      config = get_setup('nord')
   })

   -- fuzy finding
   use({
      "nvim-telescope/telescope.nvim",
      module = "telescope",
      cmd = "Telescope",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzy-native.nvim", run = "make" },
        { "nvim-telescope/telescope-file-browser.nvim" },
      },
      config = get_setup("telescope"),
    })

    -- faster init for nvim
    -- use({ 'nathom/filetype.nvim' })

    -- autocomplete
    use({
      "nvim-treesitter/nvim-treesitter",
      config = get_setup("treesitter"),
      run = ":TSUpdate",
    })
    -- use("nvim-treesitter/nvim-treesitter-textobjects")

    use({ "neovim/nvim-lspconfig", config = get_setup("lsp") })
    use({'williamboman/nvim-lsp-installer'})

   
    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must
      -- be over for it to be included in the profile
    },
  },
})



--   'christoomey/vim-tmux-navigator',   -- tmux & vim love
--   'tpope/vim-vinegar',
--   'tpope/vim-commentary',
--   'tpope/vim-surround',

--   'nathom/filetype.nvim', -- speed up nvim initialization

--   -- fuzy finding
--   'nvim-lua/plenary.nvim',
--   'nvim-telescope/telescope.nvim',


--   -- CSS
--   'norcalli/nvim-colorizer.lua',

--   -- autocompletion
--   'neovim/nvim-lspconfig', -- includes configs for most language servers
--   {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'},
--   "windwp/nvim-ts-autotag", -- autoclose html tags using treesitter

--   -- cmp is what handles the autocompletion, it uses neovim lsp
--   -- underneath to accomplish that.
--   'hrsh7th/nvim-cmp',
--   -- below are the completion sources for nvim-cmp
--   'hrsh7th/cmp-nvim-lsp',
--   'hrsh7th/cmp-buffer',
--   'hrsh7th/cmp-path',

--   -- 'windwp/nvim-autopairs',
-- }


