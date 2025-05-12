--[[
  File: nvim-notify.lua
  Description: Notification manager for Neovim
  
  Features:
  - Stylish notifications with animations
  - Configurable timeout and appearance
  - History tracking
--]]

return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    require("notify").setup({
      stages = "fade",
      timeout = 3000,
      max_width = 80,
    })
    vim.notify = require("notify")
  end,
}
