-- File: plugins/lsp/mason.lua
-- Description: Mason setup for managing LSP servers, linters, and formatters
--
-- This plugin configuration sets up Mason and Mason-Lspconfig for Neovim.
-- Mason is a package manager for external editor tooling such as LSP servers,
-- DAP servers, linters, and formatters. Mason-Lspconfig bridges Mason with
-- nvim-lspconfig, allowing for easy installation and management of language servers.
--
-- Features:
--   - Installs and manages LSP servers automatically.
--   - Provides a UI with custom borders and icons for package status.
--   - Ensures specific language servers are always installed.
--   - Enables automatic installation of servers configured via lspconfig.
--
-- Usage:
--   - Run :Mason to open the Mason UI.
--   - Servers listed in `ensure_installed` will be installed if missing.
--   - Additional servers can be installed via the Mason UI or automatically.

return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- Updates Mason registry on build
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- Integrates Mason with lspconfig
  },
  config = function()
    -- Setup Mason with custom UI settings
    require("mason").setup({
      ui = {
        border = "rounded", -- Rounded border for Mason UI window
        icons = {
          package_installed = "✓",   -- Icon for installed packages
          package_pending = "➜",     -- Icon for pending installations
          package_uninstalled = "✗", -- Icon for uninstalled packages
        },
      },
    })

    -- Setup Mason-Lspconfig to ensure specific servers are installed
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",      -- C/C++
        "cmake",       -- CMake
        "bashls",      -- Bash/Zsh
        "pyright",     -- Python
        "lua_ls",      -- Lua
      },
      automatic_installation = true, -- Automatically install configured servers
    })
  end,
}
