--[[
  File: copilot.lua
  Description: GitHub Copilot configuration with agentic features

  Integrates GitHub Copilot with advanced features including code completion
  and chat functionality for AI-assisted development.
--]]

return {
  -- Base Copilot plugin (pure Lua implementation)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-s>",
            accept_word = "<M-w>",
            accept_line = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          ["*"] = true,
          ["."] = true,
        },
      })
    end,
  },

  -- Copilot Chat for agentic features
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatToggle",
      "CopilotChatExplain",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatTests",
      "CopilotChatDocs",
      "CopilotChatReview",
      "CopilotChatRefactor",
    },
    keys = {
      -- Chat with Copilot about the selected code
      { "<leader>ccs", ":CopilotChatExplain<CR>", mode = "v", desc = "Copilot: Explain selection" },
      { "<leader>ccf", ":CopilotChatFix<CR>", mode = "v", desc = "Copilot: Fix selection" },
      { "<leader>cco", ":CopilotChatOptimize<CR>", mode = "v", desc = "Copilot: Optimize selection" },
      { "<leader>cct", ":CopilotChatTests<CR>", mode = "v", desc = "Copilot: Generate tests" },
      { "<leader>ccd", ":CopilotChatDocs<CR>", mode = "v", desc = "Copilot: Document selection" },
      { "<leader>ccr", ":CopilotChatReview<CR>", mode = "v", desc = "Copilot: Review selection" },
      { "<leader>cca", ":CopilotChatRefactor<CR>", mode = "v", desc = "Copilot: Refactor selection" },

      -- Open chat window
      { "<leader>ct", ":CopilotChatToggle<CR>", desc = "Copilot: Toggle chat" },

      -- Quick chat with current buffer
      {
        "<leader>cq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Copilot: Quick chat with buffer"
      },
    },
    config = function()
      require("CopilotChat").setup({
        -- Copilot Chat window configuration
        window = {
          layout = "float", -- "float" | "split" | "top" | "bottom"
          relative = "editor", -- "editor" | "win" | "cursor"
          width = 0.8,
          height = 0.6,
          title = "Copilot Chat",
          auto_close = false,
          -- border = "rounded", -- "none" | "single" | "double" | "rounded" | "solid" | "shadow"
        },

        -- Custom prompts
        prompts = {
          Explain = {
            prompt = "Explain how this code works in detail.",
            mapping = "<leader>cce",
            description = "Explain the selected code",
          },
          Review = {
            prompt = "Review this code. Point out bugs, code style issues, and potential improvements.",
            mapping = "<leader>ccr",
            description = "Review the selected code",
          },
          Fix = {
            prompt = "Explain what's wrong with this code and provide a corrected version with an explanation.",
            mapping = "<leader>ccf",
            description = "Fix the selected code",
          },
          Optimize = {
            prompt = "Optimize this code for better performance and readability.",
            mapping = "<leader>cco",
            description = "Optimize the selected code",
          },
          Tests = {
            prompt = "Generate comprehensive unit tests for this code.",
            mapping = "<leader>cct",
            description = "Generate tests for the selected code",
          },
          Docs = {
            prompt = "Add detailed documentation comments to this code.",
            mapping = "<leader>ccd",
            description = "Document the selected code",
          },
          Refactor = {
            prompt = "Refactor this code to improve its structure and readability without changing its behavior.",
            mapping = "<leader>cca",
            description = "Refactor the selected code",
          },
          Commit = {
            prompt = "Generate a concise commit message for this change, following conventional commits format.",
            description = "Generate a commit message",
          },
        },
      })
    end,
  }
}
