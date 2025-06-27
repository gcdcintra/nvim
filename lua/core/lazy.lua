--[[
  File: core/lazy.lua
  Description: Plugin manager configuration
--]]

local M = {}

function M.setup()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.notify("Installing lazy.nvim...", vim.log.levels.INFO)
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Configure and initialize lazy.nvim
  require("lazy").setup({
    -- Load all plugin specs from lua/plugins directory
    spec = {
      { import = "plugins" },
    },
    -- Default plugin configuration
    defaults = {
      lazy = false, -- Default plugins to lazy-load? (false = load at startup)
      version = false, -- Use latest release over HEAD for most stability
    },
    -- Plugin installation settings
    install = {
      colorscheme = { "catppuccin" }, -- Default colorscheme to install
    },
    -- Update checker configuration
    checker = {
      enabled = true, -- Check for plugin updates
    },
    -- Performance optimizations
    performance = {
      rtp = {
        -- Disable unused built-in plugins to improve startup time
        disabled_plugins = {
          "gzip", -- Edit compressed files
          "matchit", -- Extended % matching
          "matchparen", -- Highlight matching brackets
          "netrwPlugin", -- Built-in file explorer
          "tarPlugin", -- Edit tar archives
          "tohtml", -- Convert buffer to HTML
          "tutor", -- Vim tutorial
          "zipPlugin", -- Edit zip archives
        },
      },
    },
    -- Other plugin manager settings
    change_detection = {
      notify = false, -- Don't notify on config file changes
    },
  })
end

return M
