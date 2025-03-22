-- ~/.config/nvim/lua/plugins/treesitter.lua
-- Treesitter configurations

-- Install tree-sitter CLI if needed: npm install -g tree-sitter-cli
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "vim", "vimdoc", "python", "cpp", "c", "bash"},
  -- The following parsers will be automatically installed if not present
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

-- Set up indent-blankline
require("indent_blankline").setup {
  -- v2.x configuration
  show_current_context = true,
  show_current_context_start = true,
  char = "│",
  filetype_exclude = {
    "help",
    "alpha",
    "dashboard",
    "NvimTree",
    "Trouble",
    "lazy",
    "mason",
    "notify",
    "toggleterm",
  },
}

-- Set up Comment.nvim
require('Comment').setup()

-- Set up nvim-autopairs
require("nvim-autopairs").setup {}
