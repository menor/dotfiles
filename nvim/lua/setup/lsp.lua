-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------
-- based on 
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/plugins/nvim-lspconfig.lua

-- Plugin: nvim-lspconfig
-- for language server setup see: https://github.com/neovim/nvim-lspconfig

local nvim_lsp = require 'lspconfig'

-- tsserver settings
local ts_settings = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  if client.name  == "tsserver" or client.name == "jsonls" then
    ts_settings(client)
  end

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- Starting in neovim 0.7 you can use this new function instead
  -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {buffer = 0})

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>p', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Language servers:
-- Add your language server to `servers`
-- For language servers list see:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Go --> gopls
-- go install golang.org/x/tools/gopls@latest
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls

-- HTML/CSS/JSON --> vscode-html-languageserver
-- npm i -g vscode-langservers-extracted
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html

-- JavaScript/TypeScript --> tsserver
-- npm install -g typescript typescript-language-server
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gopls', 'html', 'tsserver' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
