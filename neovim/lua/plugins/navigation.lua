-- ~/.config/nvim/lua/plugins/navigation.lua
-- Navigation configurations

-- Telescope setup
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')

-- nvim-tree setup
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- project.nvim setup
require("project_nvim").setup {
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
  detection_methods = { "pattern" },
  show_hidden = false,
}

-- persistence.nvim (session management)
require("persistence").setup {
  dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"),
  options = { "buffers", "curdir", "tabpages", "winsize" },
}
