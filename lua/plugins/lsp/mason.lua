-- File: plugins/lsp/mason.lua
-- Description: Mason setup for managing LSP servers, linters, and formatters

return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",      -- C/C++
        "cmake",       -- CMake
        "bashls",      -- Bash/Zsh
        "pyright",     -- Python
        "lua_ls",      -- Lua
      },
      automatic_installation = true,
    })
  end,
}
