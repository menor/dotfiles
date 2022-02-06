-----------------------------------------------------------
-- Null LS configuration file
-----------------------------------------------------------
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

-- Plugin: null-ls
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettier.with({
      prefer_local = 'node-modules/.bin'
    }),
  }
})
