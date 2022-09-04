-----------------------------------------------------------
-- Null LS configuration file
-----------------------------------------------------------
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
-- You need to install prettierd brew install prettierd

-- Plugin: null-ls
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local status_ok, null_ls = pcall(require('null-ls'))

if (not status_ok) then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettier.with({
      prefer_local = 'node-modules/.bin'
    }),
  }
})
