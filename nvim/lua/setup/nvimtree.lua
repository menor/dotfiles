-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

-- Keybindings are defined in `mappings.lua`:
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

-- Note: options under the g: command should be set BEFORE running the
--- setup function:
--- https://github.com/kyazdani42/nvim-tree.lua#setup
--- See: `help NvimTree`

local g = vim.g

--[[ g.nvim_tree_indent_markers = 1 ]]
--[[ g.nvim_tree_git_hl = 1 ]]
--[[ g.nvim_tree_highlight_opened_files = 1 ]]
--[[ g.nvim_tree_disable_window_picker = 1 ]]
--[[ g.nvim_tree_respect_buf_cwd = 1 ]]
--[[ g.nvim_tree_width_allow_resize  = 1 ]]
--[[ g.nvim_tree_show_icons = { ]]
--[[   git = 0, ]]
--[[   folders = 0, ]]
--[[   files = 0 ]]
--[[ } ]]
--[[]]
--[[ g.nvim_tree_icons = { ]]
--[[ 	default = "‣ " ]]
--[[ } ]]
--[[]]
local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

require('nvim-tree').setup {
  open_on_setup = true,
  update_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
      }
    }
  },
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin' },
  },
  git = {
    enable = true,
    ignore = true,
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "3",
    icons = {
      show = {
        file = false,
        folder = true,
        folder_arrow = true,
        git = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
  respect_buf_cwd = true,
  view = {
    width = 32,
    side = 'right',
    mappings = {
      custom_only = false,
      list = {
        { key = 'l', cb = tree_cb('vsplit') },
        { key = 't', cb = tree_cb('tabnew') },
      }
    }
  },
}
