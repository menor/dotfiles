-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Remap leader key to spacebar
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- moving through buffers, inspired by unimpaired.vim plugin
map('n', '[b', ':bprevious<CR>')
map('n', ']b', ':bnext<CR>')
map('n', '[B', ':bfirst<CR>')
map('n', ']B', ':blast<CR>')

-- moving through tabs
-- for moving to previous and next use the default gT gt
map('n', '[t', ':tabfir<CR>')
map('n', ']t', ':tabl<CR>')

map('n', 'tn', ':tabe<CR>')
map('n', 'tc', ':tabc<CR>')
map('n', 'tC', ':tabo<CR>')

-- Clear highlighted search
map('n', '<leader>c', ':nohlsearch<CR>')

-- Keep search results centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keep cursor in position when moving lines up
map('n', 'J', 'mzJ`z')

-- Make Y yank to end of the line
map('n', 'Y', 'y$')

-- More granular undo of text

map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')
map('i', ';', ';<c-g>u')
map('i', ':', ':<c-g>u')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Make visual yanks place the cursor back where started
map('v', 'y', 'ygv<Esc>')

-- Tab to switch buffers in Normal mode
map('n', '<Tab>', ':bnext<CR>')
map('n', '<S-Tab>', ':bprevious<CR>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Neovim tree (file explorer)
-- map('n', '<leader>e', ':NvimTreeToggle<CR>')
-- map('n', '<leader>s', ':NvimTreeFindFile<CR>')

-- Telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
map('n', '<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>')
map('n', '<leader>fa', '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')

-- Packer
map('n', '<Leader>u', ':PackerSync<CR>')

-- Language Server
map('n', '<leader>li', ':LspInfo<CR>')
