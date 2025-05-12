-- File: plugins/lsp/mason.lua
-- Description: Mason setup for managing LSP servers, linters, and formatters

return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-none-ls.nvim",
  },
  config = function()
    require("mason").setup()
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
    require("mason-none-ls").setup({
      ensure_installed = {
        "shfmt",       -- Bash/Zsh formatter
        "shellcheck",  -- Bash/Zsh linter
        "clang-format",-- C/C++ formatter
        "black",       -- Python formatter
        "flake8",      -- Python linter
        "stylua",      -- Lua formatter
      },
      automatic_installation = true,
    })
  end,
}
