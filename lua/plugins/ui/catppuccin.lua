--[[
  File: catppuccin.lua
  Description: Catppuccin color scheme configuration
  
  A beautifully warm colorscheme for a cozy coding experience
  https://github.com/catppuccin/nvim
--]]

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Most vibrant dark variant: mocha
      background = {
        dark = "mocha",
      },
      transparent_background = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          -- Increase vibrancy by making certain colors more saturated
          green = "#a6e3a1",
          blue = "#89b4fa",
          lavender = "#b4befe",
          mauve = "#cba6f7",
          red = "#f38ba8",
          peach = "#fab387",
          yellow = "#f9e2af",
          teal = "#94e2d5",
        },
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = true,
        notify = true,
        mini = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
