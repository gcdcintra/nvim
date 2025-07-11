--[[ File: lua/plugins/init.lua
  Description: Plugin loader for Neovim configuration

  This file serves as the central entry point for loading all Neovim plugins.
  Plugins are organized into logical categories for better management and clarity.
--]]

return {
  require("plugins.completion.blink_cmp"),
  require("plugins.completion.github_copilot"),
  require("plugins.completion.copilot_chat"),
  require("plugins.editor.autopairs"),
  require("plugins.editor.comment"),
  require("plugins.editor.indent-blankline"),
  require("plugins.editor.surround"),
  require("plugins.git.git-conflict"),
  require("plugins.git.gitsigns"),
  require("plugins.git.neogit"),
  require("plugins.git.repolink"),
  require("plugins.lsp.mason"),
  require("plugins.tools.neo-tree"),
  require("plugins.tools.toggleterm"),
  require("plugins.tools.telescope"),
  require("plugins.treesitter.treesitter"),
  require("plugins.ui.catppuccin"),
  require("plugins.ui.dressing"),
  require("plugins.ui.lualine"),
  require("plugins.ui.nvim-notify"),
  require("plugins.ui.web-devicons"),
  require("plugins.util.mini-icons"),
  require("plugins.util.plenary"),
  require("plugins.util.which-key"),
}
