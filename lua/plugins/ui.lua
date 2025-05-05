return {
  -- Colorscheme
  {
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
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "catppuccin",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
              file_status = true,
              shorting_target = 40,
              symbols = {
                modified = " ●",
                readonly = " ",
                unnamed = "[No Name]",
                newfile = "[New]",
              },
            },
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- Better UI elements
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- Notifications
  {
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
  },
}
