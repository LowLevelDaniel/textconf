-- ~/.config/nvim/lua/plugins/navigation_extras.lua
-- Enhanced navigation configurations

-- symbols-outline.nvim configuration
require('symbols-outline').setup({
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  width = 25,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  keymaps = {
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = {icon = "", hl = "TSURI"},
    Module = {icon = "", hl = "TSNamespace"},
    Namespace = {icon = "", hl = "TSNamespace"},
    Package = {icon = "", hl = "TSNamespace"},
    Class = {icon = "𝓒", hl = "TSType"},
    Method = {icon = "ƒ", hl = "TSMethod"},
    Property = {icon = "", hl = "TSMethod"},
    Field = {icon = "", hl = "TSField"},
    Constructor = {icon = "", hl = "TSConstructor"},
    Enum = {icon = "ℰ", hl = "TSType"},
    Interface = {icon = "ﰮ", hl = "TSType"},
    Function = {icon = "", hl = "TSFunction"},
    Variable = {icon = "", hl = "TSConstant"},
    Constant = {icon = "", hl = "TSConstant"},
    String = {icon = "𝓐", hl = "TSString"},
    Number = {icon = "#", hl = "TSNumber"},
    Boolean = {icon = "⊨", hl = "TSBoolean"},
    Array = {icon = "", hl = "TSConstant"},
    Object = {icon = "⦿", hl = "TSType"},
    Key = {icon = "🔐", hl = "TSType"},
    Null = {icon = "NULL", hl = "TSType"},
    EnumMember = {icon = "", hl = "TSField"},
    Struct = {icon = "𝓢", hl = "TSType"},
    Event = {icon = "🗲", hl = "TSType"},
    Operator = {icon = "+", hl = "TSOperator"},
    TypeParameter = {icon = "𝙏", hl = "TSParameter"}
  }
})

-- nvim-scrollbar configuration
require("scrollbar").setup({
  show = true,
  show_in_active_only = false,
  set_highlights = true,
  folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
  max_lines = false, -- disables if no. of lines in buffer exceeds this
  handle = {
    text = " ",
    color = nil,
    cterm = nil,
    highlight = "CursorColumn",
    hide_if_all_visible = true,
  },
  marks = {
    Search = {
      text = { "-", "=" },
      priority = 0,
      color = nil,
      cterm = nil,
      highlight = "Search",
    },
    Error = {
      text = { "-", "=" },
      priority = 1,
      color = nil,
      cterm = nil,
      highlight = "DiagnosticVirtualTextError",
    },
    Warn = {
      text = { "-", "=" },
      priority = 2,
      color = nil,
      cterm = nil,
      highlight = "DiagnosticVirtualTextWarn",
    },
    Info = {
      text = { "-", "=" },
      priority = 3,
      color = nil,
      cterm = nil,
      highlight = "DiagnosticVirtualTextInfo",
    },
    Hint = {
      text = { "-", "=" },
      priority = 4,
      color = nil,
      cterm = nil,
      highlight = "DiagnosticVirtualTextHint",
    },
    Misc = {
      text = { "-", "=" },
      priority = 5,
      color = nil,
      cterm = nil,
      highlight = "Normal",
    },
  },
  excluded_buftypes = {
    "terminal",
  },
  excluded_filetypes = {
    "prompt",
    "TelescopePrompt",
    "noice",
    "NvimTree",
  },
  autocmd = {
    render = {
      "BufWinEnter",
      "TabEnter",
      "TermEnter",
      "WinEnter",
      "CmdwinLeave",
      "TextChanged",
      "VimResized",
      "WinScrolled",
    },
    clear = {
      "BufWinLeave",
      "TabLeave",
      "TermLeave",
      "WinLeave",
    },
  },
  handlers = {
    diagnostic = true,
    search = true,
  },
})

-- nvim-hlslens (better search experience)
require('hlslens').setup({
  calm_down = true,
  nearest_only = false,
  nearest_float_when = 'always'
})

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  kopts)
vim.api.nvim_set_keymap('n', 'N',
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

-- headlines.nvim for better markdown visualization
require('headlines').setup {
  markdown = {
    headline_highlights = {
      'Headline1',
      'Headline2',
      'Headline3',
      'Headline4',
      'Headline5',
      'Headline6',
    },
    codeblock_highlight = 'CodeBlock',
    dash_highlight = 'Dash',
    quote_highlight = 'Quote',
  },
}

-- Function to delete current file
function DeleteCurrentFile()
  local filename = vim.fn.expand('%:p')
  if filename == '' then
    vim.api.nvim_err_writeln("No file associated with the current buffer")
    return
  end
  
  local confirm = vim.fn.input("Delete file " .. filename .. "? (y/n): ")
  if confirm:lower() == 'y' then
    local success, err = os.remove(filename)
    if success then
      vim.cmd('bdelete!')
      print("File deleted: " .. filename)
    else
      vim.api.nvim_err_writeln("Failed to delete file: " .. (err or "unknown error"))
    end
  else
    print("File deletion cancelled")
  end
end
