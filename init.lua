--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██╔██║╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim Configuration
  https://github.com/gcdcintra/nvim
  
  Feature highlights:
  - Modern modular architecture with lazy loading
  - Full LSP integration and intelligent code completion
  - Advanced clipboard operations with leader key bindings
  - Comprehensive Git workflow integration
  - Elegant UI with Catppuccin theme
  
  Last updated: May 2025
--]]

-- Set leader keys
vim.g.mapleader = " " -- Space as leader key
vim.g.maplocalleader = " " -- Space as local leader

-- Load early initialization files
local early_init_dir = vim.fn.stdpath("config") .. "/init.lua.d"
if vim.fn.isdirectory(early_init_dir) == 1 then
  local early_init_files = vim.fn.glob(early_init_dir .. "/*.lua", false, true)
  for _, file in ipairs(early_init_files) do
    dofile(file)
  end
end

-------------------------------------------------------------------------------
-- Core Neovim Configuration
-------------------------------------------------------------------------------
require("core.lazy").setup() -- Plugin manager
require("core.options") -- Vim options & behavior
require("core.keymaps") -- Load key mappings
require("core.autocmds") -- Autocommands
