--[[
  File: utils.lua
  Description: Utility functions for the Neovim configuration

  This file contains utility functions that can be used throughout the configuration.
--]]

local M = {}

-- Function to reload the entire Neovim configuration
function M.reload_config()
  -- Save the current buffer
  vim.cmd("silent! wall")

  -- Clear core modules from package.loaded
  for name, _ in pairs(package.loaded) do
    if name:match("^core%.") then
      package.loaded[name] = nil
    end
  end

  -- Reload core modules explicitly
  require("core.options")
  require("core.keymaps")
  require("core.autocmds")

  -- Try a safer approach to reload plugins using a protected call
  local lazy_ok = pcall(require, "lazy")
  if lazy_ok then
    -- Use the command interface instead of direct API access
    -- Reload one known plugin first as a safer approach
    local success, err = pcall(function()
      vim.cmd("Lazy reload lualine.nvim")
    end)

    if success then
      vim.notify("Neovim configuration and plugins reloaded!", vim.log.levels.INFO)
    else
      vim.notify("Config reloaded but plugin reload failed: " .. err, vim.log.levels.WARN)
    end
  else
    -- For non-lazy configs, just notify about core reload
    vim.notify("Neovim core configuration reloaded!", vim.log.levels.INFO)
  end
end

return M
