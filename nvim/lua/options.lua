local opt = vim.opt -- to set options
local cmd = vim.cmd -- execute vim commands

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
opt.signcolumn = "yes:1"

-- line lenght marker at 80 columns
opt.colorcolumn = '80'

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

-- don't auto commenting for new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
