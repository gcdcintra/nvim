--[[ File: lua/plugins/completion/copilot_chat.lua
  Description: GitHub Copilot Chat plugin configuration

  This file configures the GitHub Copilot Chat plugin for Neovim, providing
  an interactive AI chat assistant within the editor.
--]]

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  build = "make tiktoken", -- Only on MacOS or Linux
  dependencies = {
    { "nvim-lua/plenary.nvim" }, -- Required for CopilotChat
    { "zbirenbaum/copilot.lua" }, -- Or "zbirenbaum/copilot.lua"
    { "nvim-telescope/telescope.nvim" }, -- Optional: for chat history and other integrations
  },
  opts = {
    debug = false, -- Enable debug logging
    logger = {
      file = vim.fn.stdpath("cache") .. "/copilot_chat.log", -- Log file path
    },
    show_folds = true, -- Show folds in chat window
    show_help = true, -- Show help message in chat window
    auto_follow_cursor = true, -- Auto follow cursor in chat window
    register_as_provider = true, -- Register as a completion provider (if using nvim-cmp)
    selection = {
      -- Your preferred selection mode
      -- "visual" means it will work on visual selections
      -- "line" means it will work on the current line
      -- "full" means it will work on the entire buffer
      -- "auto" will try to guess the best mode
      mode = "auto",
    },
  },
  keys = {
    { "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
    { "<leader>ccq", "<cmd>CopilotChatQuick<CR>", desc = "Quick chat with current buffer" },
    { "<leader>ccs", "<cmd>CopilotChatExplain<CR>", mode = "v", desc = "Explain selected code" },
    { "<leader>ccf", "<cmd>CopilotChatFix<CR>", mode = "v", desc = "Fix selected code" },
    { "<leader>cco", "<cmd>CopilotChatOptimize<CR>", mode = "v", desc = "Optimize selected code" },
    { "<leader>cct", "<cmd>CopilotChatTests<CR>", mode = "v", desc = "Generate tests" },
    { "<leader>ccd", "<cmd>CopilotChatDocs<CR>", mode = "v", desc = "Document code" },
    { "<leader>ccr", "<cmd>CopilotChatReview<CR>", mode = "v", desc = "Review code" },
    { "<leader>cca", "<cmd>CopilotChatRefactor<CR>", mode = "v", desc = "Refactor code" },
  },
}