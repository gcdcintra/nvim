--[[
  File: indent-blankline.lua
  Description: Indentation guides configuration
  
  Shows visual indentation guides:
  - Shows vertical lines for indentation
  - Customizable appearance
  - Scope highlighting (disabled by default)
--]]

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "│",
    },
    scope = { enabled = false },
  },
}
