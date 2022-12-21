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

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-----------------------------------------------------------
-- Insert mode shortcuts
-----------------------------------------------------------

-- Map Esc to jk
map('i', 'jk', '<Esc>')

-- More granular undo of text
--[[ map('i', ',', ',<c-g>u') ]]
--[[ map('i', '.', '.<c-g>u') ]]
--[[ map('i', '!', '!<c-g>u') ]]
--[[ map('i', '?', '?<c-g>u') ]]
--[[ map('i', ';', ';<c-g>u') ]]
--[[ map('i', ':', ':<c-g>u') ]]

-----------------------------------------------------------
-- Normal mode shortcuts
-----------------------------------------------------------

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

-- Keep cursor in the middle of the screen when scrolling with Ctrl + d/u
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Keep cursor in position when moving lines up
map('n', 'J', 'mzJ`z')

-- Make Y yank to end of the line
map('n', 'Y', 'y$')

-- Switch between system and vim clipboard
map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>Y', '"+Y')

map('n', '<leader>d', '"_d')
map('v', '<leader>d', '"_d')

-- paste over selected text without putting deleted text in register
map('x', '<leader>p', '"_dP')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Tab to switch buffers in Normal mode
map('n', '<Tab>', ':bnext<CR>')
map('n', '<S-Tab>', ':bprevious<CR>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving
map('n', '<leader>w', ':w<CR>')

-----------------------------------------------------------
-- Visual mode shortcuts
-----------------------------------------------------------

-- Make visual yanks place the cursor back where started
map('v', 'y', 'ygv<Esc>')

-- Stay in indent in visual mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Move blocks up and down with Alt
map('v', '<A-j>', ':m .+1<CR>gv=gv')
map('v', '<A-k>', ':m .-2<CR>gv=gv')
map('v', 'p', '"_dP') -- do not put replaced text on the register

-----------------------------------------------------------
-- Quickfix window shortcuts
-----------------------------------------------------------

map('n', '<C-k>', '<cmd>cnext<CR>zz')
map('n', '<C-j>', '<cmd>cprev<CR>zz')
map('n', '<leader>k', '<cmd>lnext<CR>zz')
map('n', '<leader>j', '<cmd>lprev<CR>zz')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Neovim tree (file explorer)
map('n', '<leader>e', ':NvimTreeToggle<CR>')
map('n', '<leader>s', ':NvimTreeFindFile<CR>')

-- Telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").git_files()<cr>')
map('n', '<leader>fj', '<cmd>lua require("telescope.builtin").find_files()<cr>')
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
map('n', '<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>')
map('n', '<leader>fa', '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')

-- Packer
map('n', '<Leader>u', ':PackerSync<CR>')

-- Language Server
map('n', '<leader>li', ':LspInfo<CR>')
