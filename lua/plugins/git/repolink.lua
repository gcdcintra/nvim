--[[
  File: repolink.lua
  Description: GitHub URL handler
  
  Improved GitHub URL handler:
  - Generate shareable links to code
  - Support for GitHub, GitLab, Bitbucket
  - Line number and selection support
--]]

return {
  "9seconds/repolink.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gl", "<cmd>RepoLink<CR>", mode = { "n", "v" }, desc = "Get GitHub Link" },
    { "<leader>gL", "<cmd>RepoLink!<CR>", mode = { "n", "v" }, desc = "Get GitHub Link with Line Number" },
  },
  opts = {}, -- Uses defaults which work with GitHub, GitLab, Bitbucket
}
