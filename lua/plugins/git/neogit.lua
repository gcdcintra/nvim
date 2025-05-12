--[[
  File: neogit.lua
  Description: Neogit configuration
  
  Magit-like interface for Git:
  - Full-featured Git UI
  - Integration with diffview.nvim and telescope
  - Commit, branch, and merge management
--]]

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- Required dependency
    "sindrets/diffview.nvim",        -- Optional but recommended for enhanced diff view
    "nvim-telescope/telescope.nvim", -- Optional: for commit and branch fuzzy search
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
    { "<leader>gc", "<cmd>Neogit commit<CR>", desc = "Neogit Commit" },
    { "<leader>gp", "<cmd>Neogit pull<CR>", desc = "Neogit Pull" },
    { "<leader>gP", "<cmd>Neogit push<CR>", desc = "Neogit Push" },
  },
  opts = {
    integrations = {
      diffview = true, -- Enable diffview.nvim integration
      telescope = true, -- Enable telescope integration
    },
    -- Disable remember_settings to avoid potential conflicts
    remember_settings = false,
    -- Customize some common commands for speed
    commit_popup = {
      kind = "split", -- or "split" or "tab"
    },
    -- Customize the signs for each git status
    signs = {
      -- { CLOSED, OPENED }
      section = { "", "" },
      item = { "", "" },
      hunk = { "", "" },
    },
    -- Automatically refresh on file changes
    auto_refresh = true,
    -- Syntax highlighting inside git commits
    use_telescope = true,
  },
}
