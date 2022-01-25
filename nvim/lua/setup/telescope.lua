local telescope = require('telescope')
local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        mirror = true
      }
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          ["<C-h>"] = fb_actions.goto_home_dir
        }
      },
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  } 
}

telescope.load_extension('fzy_native')
telescope.load_extension("file_browser")
