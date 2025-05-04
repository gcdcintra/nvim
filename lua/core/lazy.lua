--[[
  File: plugins/init.lua
  Description: Plugin manager configuration and core plugin setup

  This file configures lazy.nvim, the plugin manager, and defines
  core plugin settings. Each plugin or related group of plugins
  is defined in its own file within the plugins directory.
--]]

local M = {}

-- Function to bootstrap and configure lazy.nvim
function M.setup()
  -- Bootstrap lazy.nvim if not installed
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
      colorscheme = { "gruvbox" }, -- Colorscheme to use during installation
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
    -- LuaRocks configuration
    rocks = {
      enabled = false, -- Disable luarocks by default since we set it manually in early_init
    },
  })
end

return M
