-- ~/.config/nvim/lua/plugins/ui.lua
-- UI configurations

-- lualine setup
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- alpha-nvim (dashboard)
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    "                                                     ",
}

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = "Dev + Scientific Environment"

alpha.setup(dashboard.opts)

-- nvim-notify
vim.notify = require("notify")

-- dressing.nvim
require('dressing').setup({
  input = {
    enabled = true,
    default_prompt = "Input:",
    prompt_align = "left",
    insert_only = true,
    start_in_insert = true,
    border = "rounded",
    relative = "cursor",
    prefer_width = 40,
    width = nil,
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },
  },
  select = {
    enabled = true,
    backend = { "telescope", "fzf", "builtin" },
    trim_prompt = true,
    telescope = nil,
  },
})

-- osc52 (clipboard in SSH)
require('osc52').setup {
  max_length = 0,  -- Maximum length of selection (0 for no limit)
  silent = false,  -- Disable message when copied
  trim = false,    -- Trim surrounding whitespace before copy
}

vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>yy', '<leader>y_', {remap = true})
vim.keymap.set('v', '<leader>y', require('osc52').copy_visual)
