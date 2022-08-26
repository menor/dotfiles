local ts = require('nvim-treesitter.configs')

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'comment',
    'css',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'rust',
    'typescript',
    'zig'
  },
   -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 4096, -- Do not enable for files with more than n lines, int
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
  highlight = {
    enable = true
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
