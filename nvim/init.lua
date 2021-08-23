-- Based on https://oroques.dev/notes/neovim-init/
-- You will need to install language servers
-- TODO: See if this can be auto
-- npm i -g typescript typescript-language-server
-- npm i -g vscode-langservers-extracted 

local cmd = vim.cmd                       -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn                         -- to call Vim functions e.g. fn.bufnr()
local g = vim.g                           -- a table to access global variables
local opt = vim.opt                       -- to set options
local map = vim.api.nvim_set_keymap       -- to set keyboard shortcuts

g.mapleader = ' '                     -- remap leader key to spacebar

opt.swapfile = false                  -- Disable swapfiles
opt.visualbell = true                 -- visual bell instead of beeping
opt.number = true                     -- line
opt.cursorline = true
opt.foldmethod = 'syntax'

-- indentation tabs = 2 spaces
opt.expandtab = true
opt.shiftwidth=2
opt.tabstop=2

-- display extra whitespace
-- for some reason this is not working yet, maybe related to no syntax?
opt.listchars = { tab = '»·', trail = '·', nbsp = '·'}

-- always display signcolumn
opt.signcolumn='number'

-- check file after 4 secs of inactivity in normal mode,
-- so files are refreshed on outside changes
-- lua still does not support autocommands so we need to call it
-- as a vim command https://github.com/neovim/neovim/pull/12378
cmd 'au CursorHold * checktime'

opt.undofile = true                 -- use an undo file
opt.undodir='~/.tmp/nvim/.vimundo/' -- set a directory to store the undo history

opt.termguicolors = true

-- Open URL under cursor with browser
-- https://stackoverflow.com/a/67890996
-- map('n', 'gx', cmd "execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>", {noremap = true, silent = true})

----------------------------------- plugins -----------------------------------

-- we use Paq as a package manager since it is written in Lua
-- we need to install it first https://github.com/savq/paq-nvim 
-- you can run :PaqSync to install, clean and update packages in one go
require 'paq-nvim' {
  'savq/paq-nvim',
  '907th/vim-auto-save',
  'christoomey/vim-tmux-navigator',   -- tmux & vim love
  'tpope/vim-vinegar',
  'tpope/vim-commentary',
  'tpope/vim-surround',

  -- for improved syntax highlighting, for how to install language parsers
  -- check https://github.com/nvim-treesitter/nvim-treesitter#language-parsers
  "nvim-treesitter/nvim-treesitter",

  -- UI
  'arcticicestudio/nord-vim',
  'sainnhe/everforest',

  -- autocompletion
  'neovim/nvim-lspconfig', -- includes configs for most language servers
  -- autocompe is what handles the autocompletion, it uses neovim lsp
  -- underneath to accomplish that. Author is working on an improved version
  -- of this plugin https://github.com/hrsh7th/nvim-cmp so that is something to
  -- keep an eye on
  'hrsh7th/nvim-compe'     
}

------------------------------------ theme -------------------------------------

-- nord
-- https://www.nordtheme.com/docs/ports/vim/configuration
g.nord_italic = 1
g.nord_italic_comments = 1
g.nord_underline = 1
g.nord_uniform_diff_background = 1
g.nord_cursor_line_number_background = 1

-- everforest
vim.g.everforest_background = "medium"
vim.g.everforest_enable_italic = 1
vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_diagnostic_virtual_text = "colored"
vim.g.everforest_current_word = "bold"

cmd 'colorscheme nord'  

-------------------------------- plugins config ---------------------------------
-- vim autosave
g.auto_save = 1           -- enable autosave on vim startup
g.auto_save_silent = 1

-- treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({
  ensure_installed = "maintained",
  highlight = { enable = true }
})

-- typescript
require('lspconfig').tsserver.setup{}

-- nvim-compe
opt.completeopt = "menuone,noselect"

require('compe').setup({
  enabled = true,
  autocomplete = true,
  source = {
    path = true,
    nvim_lsp = true,
    nvim_lua = true,
  },
})

---------------------------------- keybindings -----------------------------------
-- moving through buffers, inspired by unimpaired.vim plugin
map('n', '[b', ':bprevious<CR>', {noremap = true, silent = true})
map('n', ']b', ':bnext<CR>', {noremap = true, silent = true})
map('n', '[B', ':bfirst<CR>', {noremap = true, silent = true})
map('n', ']B', ':blast<CR>', {noremap = true, silent = true})

-- moving through tabs
-- for moving to previous and next use the default gT gt
map('n', '[t', ':tabfir<CR>', {noremap = true, silent = true})
map('n', ']t', ':tabl<CR>', {noremap = true, silent = true})

map('n', 'tn', ':tabe<CR>', {noremap = true, silent = true})
map('n', 'tc', ':tabc<CR>', {noremap = true, silent = true})
map('n', 'tC', ':tabo<CR>', {noremap = true, silent = true})

-- Clear highlighted search
map('n', '<leader>C', ':nohlsearch<CR>', {noremap = true, silent = true})
