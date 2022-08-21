local opt = vim.opt   -- to set options
local cmd = vim.cmd   -- execute vim commands
local g = vim.g       -- set global variables

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.swapfile = false                  -- Disable swapfile
opt.undofile = true                   -- Use an undo file
opt.undodir= os.getenv('HOME') .. '/.tmp/nvim/.vimundo/' -- Undo file location

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.colorcolumn = '80'                -- Line length marker
opt.cursorline = true                 -- Highlight cursor line
opt.laststatus = 3                    -- Set global status line
opt.number = true                     -- Show line number
opt.signcolumn = 'yes:1'              -- Always display sign column
opt.termguicolors = true              -- Enable 24-bit RGB colors

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true                  -- Use spaces instead of tabs
opt.shiftwidth = 2                    -- Shift 2 spaces when tab
opt.smartindent = true                -- Autoindent new lines
opt.tabstop = 2                       -- 1 tab = 2 spaces

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.synmaxcol = 240                   -- Avoid syntax highlight on long lines

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- check file after 4 secs of inactivity in normal mode,
-- so files are refreshed on outside changes
-- lua still does not support autocommands so we need to call it
-- as a vim command https://github.com/neovim/neovim/pull/12378
cmd 'au CursorHold * checktime'

-- don't auto commenting for new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
