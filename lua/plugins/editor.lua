--[[
  File: editor.lua
  Description: Editor enhancement plugins configuration

  This file configures several plugins that enhance the editing experience:

  1. nvim-autopairs - Automatically adds closing brackets, quotes, etc.
     - TypeScript-aware
     - Fast wrap functionality for surrounding text
     - Configurable for different filetypes

  2. Comment.nvim - Smart code commenting
     - Context-aware commenting (uses treesitter)
     - Line and block comments
     - Multiple language support

  3. nvim-surround - Easily change/add/delete surrounding pairs
     - Works with brackets, quotes, tags, etc.
     - Visual and operator modes

  4. indent-blankline - Visual indentation guides
     - Shows vertical lines for indentation
     - Customizable appearance
     - Scope highlighting (disabled by default)
--]]

return {
  -- Auto-pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    lazy = false,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup({
        pre_hook = function(ctx)
          local U = require("Comment.utils")
          local location = nil
          if ctx.ctype == U.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
          end
          return require("ts_context_commentstring.internal").calculate_commentstring({
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
          })
        end,
      })
    end,
  },

  -- Easy surround selections
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "│",
      },
      scope = { enabled = false },
    },
  },
}
