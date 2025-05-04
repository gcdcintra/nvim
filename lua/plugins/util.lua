--[[
  File: util.lua
  Description: Utility plugins configuration

  This file contains configurations for utility plugins:

  1. plenary.nvim - Lua utility functions used by many plugins

  2. mini.icons - Icon set used by which-key and other plugins

  3. which-key.nvim - Keybinding popup helper with the following features:
     - Visual display of available keybindings
     - Leader key group organization
     - Customizable appearance and layout
     - Integration with other plugins via presets
     - Easy keymap discoverability

  The which-key configuration includes:
  - Proper timeout settings for key detection
  - Spelling suggestion plugin (shows spelling corrections in popup)
  - Display customizations (borders, icons, layout)
  - Keymap group registrations for organized command display
  - Comment/surround plugin integration
--]]

return {
  -- Core utilities
  {
    "nvim-lua/plenary.nvim", -- Useful Lua functions used by many plugins
    lazy = true,
  },

  -- Icons for which-key and other plugins
  {
    "echasnovski/mini.icons",
    version = false,
    lazy = false,
  },

  -- Better UI for commands
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      -- Disable warnings about issues with mappings
      notify = false,
      -- Don't show messages about keys being pressed
      show_keys = false,
      win = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
      icons = {
        breadcrumb = "»", -- Symbol used in the command line area that shows your active key combo
        separator = "➜", -- Symbol used between a key and its label
        group = "+", -- Symbol prepended to a group
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      replace = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
        ["<bs>"] = "BKSP",
      },
      -- Fix for deprecated options
      keys = {
        -- Patterns to hide from the popup
        ["<silent>"] = "",
        ["<cmd>"] = "",
        ["<Cmd>"] = "",
        ["<CR>"] = "",
        ["^:"] = "",
        ["^ "] = "",
        ["^call "] = "",
        ["^lua "] = "",
      },
      show_help = false,  -- Hide help message at the bottom of popup
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      -- Register base groups
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>b", group = "Buffer" },
        { "<leader>h", group = "Hunks" },
        { "<leader>t", group = "Toggle" },
      })

      -- Add specific prefix groups for overlapping keymaps
      wk.add({
        { "gc", group = "Comments" },
        { "gb", group = "Block Comments" },
        { "ys", group = "Surround" },
      })

      -- Register helpful descriptions for non-leader keys
      wk.add({
        { "<C-h>", desc = "Navigate left" },
        { "<C-j>", desc = "Navigate down" },
        { "<C-k>", desc = "Navigate up" },
        { "<C-l>", desc = "Navigate right" },
        { "<C-d>", desc = "Half page down and center" },
        { "<C-u>", desc = "Half page up and center" },
      })
    end,
  },
}
