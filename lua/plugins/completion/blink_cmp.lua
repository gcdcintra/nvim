-- File: plugins/completion/blink_cmp.lua
-- Description: Configuration for blink.cmp with LSP and additional features

return {
  "saghen/blink.cmp",
  version = "1.*",
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
      menu = {
      },
      documentation = {
        window = {
        },
        auto_show = true,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = { enabled = true },
    snippets = { preset = "luasnip" },
  },
  config = function(_, opts)
    require("blink.cmp").setup(opts)

    vim.keymap.set("i", "<C-y>", function()
      require("blink.cmp").complete()
    end, { noremap = true, silent = true })

    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Configure LSP servers
    local servers = {
      clangd = {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      },
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
