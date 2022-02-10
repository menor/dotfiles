require('nvim-treesitter.configs').setup({
  ensure_installed = 'maintained',
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  autotag = {
    enable = true,
    filetypes = {
      'html',
      'javascript',
      'typescript',
      'markdown',
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<TAB>',
    },
  },

  -- this is to enable JoosepAlviste/nvim-ts-context-commentstring
  -- to allow comments in embedded languages (i.e. css in js)
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

-- Setup treesitter
local ts = require('nvim-treesitter.configs')
ts.setup({ ensure_installed = 'maintained', highlight = { enable = true } })
