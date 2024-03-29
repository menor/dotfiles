-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- based on
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/plugins/nvim-lspconfig.lua

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig

-- For configuration see the Wiki: https://github.com/neovim/nvim-lspconfig/wiki
-- Autocompletion settings of "nvim-cmp" are defined in plugins/nvim-cmp.lua

-- make a protected call so we don't get an error on the first call
local lsp_status_ok, nvim_lsp = pcall(require, 'lspconfig')

if not lsp_status_ok then
  return
end

-- Diagnostic options, see: `:help vim.diagnostic.config`
-- TODO:  See if text from the panel can be copied
vim.diagnostic.config({
  update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
	},
})

-- Show line diagnostics automatically in hover window
vim.cmd([[
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]])

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Highlighting references
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.keymap.set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.keymap.set('n', 'gL', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.keymap.set('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.keymap.set('n', '<leader>p', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', opts)
end

-----------------------------------------------------------
-- Language Servers
-----------------------------------------------------------

-- For language servers list see:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Deno - denolos
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#denols

-- Go --> gopls
-- go install golang.org/x/tools/gopls@latest
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls

-- HTML/CSS/JSON --> vscode-html-languageserver
-- :MasonInstall html-lsp
-- https://github.com/microsoft/vscode-html-languageservice

-- JavaScript/TypeScript --> tsserver
-- npm install -g typescript typescript-language-server
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver

-- Rust server --> rust_analyzer
-- rustup component add rust-src
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer

-- Define `root_dir` when needed
-- See: https://github.com/neovim/nvim-lspconfig/issues/320
-- This is a workaround, maybe not work with some servers.
local root_dir = function()
  return vim.fn.getcwd()
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- Add your language server to `here
local servers = { 'cssls', 'gopls', 'html', 'tsserver', 'rust_analyzer' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
  }
end
