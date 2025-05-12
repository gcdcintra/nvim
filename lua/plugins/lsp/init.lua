-- File: plugins/lsp/init.lua
-- Description: LSP configuration for Neovim (using mason-lspconfig)

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- Setup Mason
    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Setup Mason-LSPConfig
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",      -- C/C++
        "pyright",     -- Python
        "lua_ls",      -- Lua
      },
      automatic_installation = true,
    })

    -- Configure LSP servers
    local servers = {
      clangd = {},
      pyright = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Disable",
              keywordSnippet = "Disable",
            },
          },
        },
      },
    }

    for server, config in pairs(servers) do
      lspconfig[server].setup(config)
    end
  end,
}
