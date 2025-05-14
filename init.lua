--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██╔██║╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

  Neovim Configuration
  https://github.com/gcdcintra/nvim
--]]

-- Set leader keys
vim.g.mapleader = " " -- Space as leader key
vim.g.maplocalleader = " " -- Space as local leader

-------------------------------------------------------------------------------
-- Core Neovim Configuration
-------------------------------------------------------------------------------
require("core.lazy").setup() -- Plugin manager
require("core.options") -- Vim options & behavior
require("core.keymaps") -- Load key mappings
require("core.autocmds") -- Autocommands