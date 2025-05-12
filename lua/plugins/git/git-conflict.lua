--[[
  File: git-conflict.lua
  Description: Git conflict resolution plugin
  
  Helps resolve merge conflicts:
  - Visual highlighting of conflicts
  - Easy navigation between conflicts
  - Simple keymaps for resolving conflicts
--]]

return {
  "akinsho/git-conflict.nvim",
  version = "*",
  cmd = {
    "GitConflictChooseOurs",
    "GitConflictChooseTheirs",
    "GitConflictChooseBoth",
    "GitConflictChooseNone",
    "GitConflictNextConflict",
    "GitConflictPrevConflict",
    "GitConflictListQf",
  },
  keys = {
    { "<leader>gco", "<cmd>GitConflictChooseOurs<CR>", desc = "Git Choose Ours" },
    { "<leader>gct", "<cmd>GitConflictChooseTheirs<CR>", desc = "Git Choose Theirs" },
    { "<leader>gcb", "<cmd>GitConflictChooseBoth<CR>", desc = "Git Choose Both" },
    { "<leader>gcn", "<cmd>GitConflictChooseNone<CR>", desc = "Git Choose None" },
    { "]x", "<cmd>GitConflictNextConflict<CR>", desc = "Next Git Conflict" },
    { "[x", "<cmd>GitConflictPrevConflict<CR>", desc = "Previous Git Conflict" },
  },
  opts = {
    default_mappings = false,
    default_commands = true,
    disable_diagnostics = false,
    highlights = {
      incoming = "DiffAdd",
      current = "DiffText",
    },
  },
}
