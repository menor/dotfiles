-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup({
  function(use)
    -- Packer can manage itself
    use({
      'wbthomason/packer.nvim',
      config = get_setup('packer')
    })

   -- UI
   use({
      'shaunsingh/nord.nvim',
      config = get_setup('nord')
   })

   use ({
      'nvim-lualine/lualine.nvim',
      config = get_setup('lualine'),
      requires = {
        'kyazdani42/nvim-web-devicons', opt = true
      }
   })

    -- Helpers
    use({
      'pocco81/auto-save.nvim',
      config = get_setup('autosave')
    })
    use({
      'numToStr/Comment.nvim',
      config = get_setup('comment')
    })
    -- this is to get proper commenting in embeded languages (i.e. css in js)
    -- needs to be enabled in nvim-treesiter config
    use({
      'JoosepAlviste/nvim-ts-context-commentstring'
    })

    use({'christoomey/vim-tmux-navigator'})

    -- Faster init for nvim
    use({
      'nathom/filetype.nvim',
      config = get_setup('filetype')
    })

   -- File explorer
    use({
      'kyazdani42/nvim-tree.lua',
       config = get_setup('nvimtree'),
       requires = {
         'kyazdani42/nvim-web-devicons', opt = true
       },
    })

   -- Fuzy finding
   use({
      'nvim-telescope/telescope.nvim',
      module = "telescope",
      cmd = "Telescope",
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzy-native.nvim', run = 'make' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
      },
      config = get_setup('telescope'),
    })

    -- Syntax highlighting
    use({
      'nvim-treesitter/nvim-treesitter',
      config = get_setup('treesitter'),
      run = ':TSUpdate',
    })
    use('nvim-treesitter/nvim-treesitter-textobjects')

    -- Language Server
    -- The Language server client is integrated into neovim
    -- This plugin is only a set of configs for it
    use({ 'neovim/nvim-lspconfig', config = get_setup('lsp') })

    -- Allows you to install language servers calling :LspInstall
    use({'williamboman/mason.nvim', config = get_setup('mason') })
    use({
      'williamboman/mason-lspconfig.nvim',
      config = get_setup('mason-lspconfig')
    })


    use({
      'jose-elias-alvarez/null-ls.nvim',
      config = get_setup('nullls'),
      requires = {'nvim-lua/plenary.nvim'},
    })


    -- Autocompletion
    use({'hrsh7th/nvim-cmp',
      config = get_setup('cmp'),
      requires = {
        'L3MON4D3/LuaSnip',           -- Snippets plugin
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',  -- Snippets source for nvim-cmp
        'onsails/lspkind-nvim',      -- Adds icons to completion panel
      }
    })

    -- Snippets
    use 'rafamadriz/friendly-snippets'

    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'windwp/nvim-ts-autotag'     -- For HTMLish, enabled on the treesitter config
    use({
      'windwp/nvim-autopairs',
      config = get_setup('autopairs')
    })


    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must
      -- be over for it to be included in the profile
    },
  },
})
