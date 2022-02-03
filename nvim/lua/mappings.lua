local function map(mode, lhs, rhs, opts) local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- remap leader key to spacebar
vim.g.mapleader = ' '

-- moving through buffers, inspired by unimpaired.vim plugin
map('n', '[b', ':bprevious<CR>', {silent = true})
map('n', ']b', ':bnext<CR>', {silent = true})
map('n', '[B', ':bfirst<CR>', {silent = true})
map('n', ']B', ':blast<CR>', {silent = true})

-- moving through tabs
-- for moving to previous and next use the default gT gt
map('n', '[t', ':tabfir<CR>', {silent = true})
map('n', ']t', ':tabl<CR>', {silent = true})

map('n', 'tn', ':tabe<CR>', {silent = true})
map('n', 'tc', ':tabc<CR>', {silent = true})
map('n', 'tC', ':tabo<CR>', {silent = true})

-- Clear highlighted search
map('n', '<leader>c', ':nohlsearch<CR>', {silent = true})

-- Keep search results centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keep cursor in position when moving lines up
map('n', 'J', 'mzJ`z')

-- Make Y yank to end of the line
map('n', 'Y', 'y$')

-- More granular undo of text
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")
map("i", ";", ";<c-g>u")
map("i", ":", ":<c-g>u")

-- Make visual yanks place the cursor back where started
map('v', 'y', 'ygv<Esc>')

-- Tab to switch buffers in Normal mode
map('n', '<Tab>', ':bnext<CR>')
map('n', '<S-Tab>', ':bprevious<CR>')

-- Neovim tree (file explorer)
map('n', '<leader>e', ':NvimTreeToggle<CR>') 
map('n', '<leader>s', ':NvimTreeFindFile<CR>')

-- Telescope
map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "<leader>fd", '<cmd>lua require("telescope.builtin").diagnostics()<cr>')
map("n", "<leader>fa", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')

-- Packer
map('n', '<Leader>u', ':PackerSync<CR>')

-- Language Server
map('n', '<leader>li', ':LspInfo<CR>')
local opts = { noremap=true, silent=true }

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>li', ':LSPInfo<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

