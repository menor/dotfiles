-- based on 
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/plugins/nvim-lspconfig.lua

-- Plugin: nvim-lspconfig
-- for language server setup see: https://github.com/neovim/nvim-lspconfig

-- make a protected call so we don't get an error on the first call
local lsp_status_ok, nvim_lsp = pcall(require, 'lspconfig')

if not lsp_status_ok then
  return
end


-- tsserver settings
local ts_settings = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  --[[ if client.name  == 'tsserver' or client.name == 'jsonls' then ]]
    --[[ ts_settings(client) ]]
  --[[ end ]]

  --[[ local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end ]]
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- Starting in neovim 0.7 you can use this new function instead
  -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {buffer = 0})

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.keymap.set('n', '<leader>p', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

-- Language servers:
-- Add your language server to `servers`
-- For language servers list see:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Deno - denolos
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols

-- Go --> gopls
-- go install golang.org/x/tools/gopls@latest
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls

-- HTML/CSS/JSON --> vscode-html-languageserver
-- npm i -g vscode-langservers-extracted
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html

-- JavaScript/TypeScript --> tsserver
-- npm install -g typescript typescript-language-server
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver

-- Rust server --> rust_analyzer
-- rustup component add rust-src
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'denols', 'gopls', 'html', 'tsserver', 'rust_analyzer' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
