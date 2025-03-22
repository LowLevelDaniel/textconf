-- ~/.config/nvim/lua/plugins/debug.lua
-- Debugging configurations

local dap = require('dap')

-- Only load dapui if nvim-nio is available
local has_dapui, dapui = pcall(require, 'dapui')
if has_dapui then
  dapui.setup()
  
  -- Auto open/close dapui
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

-- Setup virtual text
local has_virtual_text, _ = pcall(require, 'nvim-dap-virtual-text')
if has_virtual_text then
  require("nvim-dap-virtual-text").setup()
end

-- Python setup
dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return '/usr/bin/python3'
    end,
  },
}
