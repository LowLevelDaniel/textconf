-- ~/.config/nvim/lua/utils.lua
-- Utility functions

local M = {}

-- Create a directory if it doesn't exist
M.ensure_dir = function(path)
  local stat = vim.loop.fs_stat(path)
  if not stat then
    vim.loop.fs_mkdir(path, 755)
  end
end

-- Check if file exists
M.file_exists = function(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "file"
end

-- Check if directory exists
M.dir_exists = function(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "directory"
end

-- Notify with nice UI if available
M.notify = function(msg, level, opts)
  level = level or "info"
  opts = opts or {}
  
  if vim.notify then
    vim.notify(msg, level, opts)
  else
    if level == "error" then
      vim.api.nvim_err_writeln(msg)
    else
      vim.api.nvim_echo({{msg, "Normal"}}, true, {})
    end
  end
end

-- Safe require that doesn't error when module is not found
M.safe_require = function(module)
  local ok, result = pcall(require, module)
  if not ok then
    M.notify("Failed to load module: " .. module, "warn")
    return nil
  end
  return result
end

return M
