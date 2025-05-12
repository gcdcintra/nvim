-- File: plugins/completion/blink_cmp.lua
-- Description: Configuration for blink.cmp with LSP and additional features

return {
  "saghen/blink.cmp",
  dependencies = {
    "neovim/nvim-lspconfig", -- LSP support
    "L3MON4D3/LuaSnip", -- Snippet support
    "rafamadriz/friendly-snippets", -- Predefined snippets
  },
  opts = {
    keymap = { preset = "default" },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = false },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = { enabled = true },
    snippets = { preset = "luasnip" },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Configure LSP servers
    local servers = {
      clangd = {},
      cmake = {},
      bashls = {},
      pylsp = {},
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
      config.capabilities = capabilities
      lspconfig[server].setup(config)
    end

    -- Configure LuaSnip
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
