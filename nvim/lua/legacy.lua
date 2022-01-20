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

-- use an undo file
opt.undofile = true
-- set a directory to store the undo history
opt.undodir= os.getenv("HOME") .. '/.tmp/nvim/.vimundo/'

opt.termguicolors = true

-- Open URL under cursor with browser
-- https://stackoverflow.com/a/67890996
-- map('n', 'gx', cmd "execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>", {noremap = true, silent = true})

------------------------------------ theme -------------------------------------

-- nord
-- https://www.nordtheme.com/docs/ports/vim/configuration
g.nord_italic = 1
g.nord_italic_comments = 1
g.nord_underline = 1
g.nord_uniform_diff_background = 1
g.nord_cursor_line_number_background = 1

cmd 'colorscheme nord'  

-------------------------------- plugins config ---------------------------------

-- Autosave

local autosave = require('autosave')

autosave.setup(
  {
    enabled = true,
    execution_message = '',
    events = {'InsertLeave', 'TextChanged'},
    conditions = {
      exists = true,
      modifiable = true,
    },
  }
)
-- Filetype

-- Do not source the default filetype.vim
-- Uses filetype.nvim plugin instead
-- Speeds up nvim initialization 
-- Seems this line won't be needed after nvim 0.6.0
-- https://github.com/nathom/filetype.nvim#usage
vim.g.did_load_filetypes = 1

-- Treesitter

require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  highlight = { enable = true },
  -- Use treesitter to autoclose and autorename html tag
  autotag = {
    enable = true
  },
})

-- lspconfig
-- https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- --   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- --   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- --   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- --   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- --   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- --   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- --   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- --   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- --   buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach
}

-- Go pls
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md
require'lspconfig'.gopls.setup{}

-- nvim-cmp
local cmp = require('cmp').setup({
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'path' },
  }
})

-- The nvim-cmp almost supports LSP's capabilities
-- so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})
map('n', '<leader>fa', ':Telescope file_browser<CR>', {noremap = true, silent = true})
map('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true})

require('telescope').setup{
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        mirror = true
      }
    }
  }
}

-- autopairs
-- require('nvim-autopairs').setup({})

-- require("nvim-autopairs.completion.cmp").setup({
  -- map_cr = true, --  map <CR> on insert mode
  -- map_complete = true, -- it will auto insert `(` after select function or method item
  -- auto_select = false,  -- auto select first item
-- })

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
map('n', '<leader>c', ':nohlsearch<CR>', {noremap = true, silent = true})

-- Sane mappings
map('n', 'Y', 'y$', {noremap = true, silent = true})

