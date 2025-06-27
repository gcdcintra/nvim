--[[ File: lua/plugins/completion/github_copilot.lua
  Description: GitHub Copilot plugin configuration

  This file configures the GitHub Copilot plugin for Neovim, enabling AI-powered
  code suggestions and completions.

  Features:
  - Inline code suggestions as you type.
  - Integration with completion engines.
--]]

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = false },
    },
  },
}
