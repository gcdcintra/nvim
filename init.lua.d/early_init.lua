--[[
  File: early_init.lua
  Description: Early initialization to fix checkhealth warnings
  
  This file is loaded early in the Neovim startup process and addresses
  several issues reported by checkhealth:
  
  1. Disables deprecation warnings for vim.validate
  2. Configures provider options to disable unused providers
  3. Sets options for luarocks to avoid hererocks warnings
]]--

-- Disable deprecated warnings for plugins using vim.validate
-- This addresses the warning from nvim-notify and LuaSnip
vim.deprecate = function(name, alternative, version, plugin)
  -- Silent deprecation warnings
  return name
end

-- Configure providers - disable unused ones to avoid warnings
vim.g.loaded_perl_provider = 0  -- Disable Perl provider
-- Only load Python provider if pynvim is available
if vim.fn.executable('pip') == 1 and vim.fn.system('pip list | grep pynvim') ~= '' then
  vim.g.python3_host_prog = vim.fn.exepath('python3')
else
  vim.g.loaded_python3_provider = 0
end

-- Configure lazy.nvim rocks settings
vim.g.lazy_rocks_disabled = true -- Disable luarocks integration in lazy.nvim