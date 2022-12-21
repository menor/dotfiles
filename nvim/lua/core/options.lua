local opt = vim.opt   -- to set options
local g = vim.g       -- set global variables

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.swapfile = false                  -- Disable swapfile
opt.undofile = true                   -- Use an undo file
opt.undodir= os.getenv('HOME') .. '/.tmp/nvim/.vimundo/' -- Undo file location
opt.backup = false                    -- Disable backup

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.termguicolors = true              -- Enable 24-bit RGB colors
opt.colorcolumn = '80'                -- Line length marker
opt.cursorline = true                 -- Highlight cursor line
opt.laststatus = 3                    -- Set global status line
opt.number = true                     -- Show line number
opt.relativenumber = true             -- Show relative line number
opt.signcolumn = 'yes:1'              -- Always display sign column
opt.scrolloff = 8                     -- Keep selected line away from the border
opt.wrap = false                      -- Disable line wrap
opt.hlsearch = false                  -- Disable highlight search
opt.incsearch = true                  -- Incremental search
opt.updatetime = 50                  -- Faster completion

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true                  -- Use spaces instead of tabs
opt.shiftwidth = 4                    -- Shift 4 spaces when tab
opt.smartindent = true                -- Autoindent new lines
opt.tabstop = 4                       -- 1 tab = 4 spaces

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.synmaxcol = 240                   -- Avoid syntax highlight on long lines

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"

-- -- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
