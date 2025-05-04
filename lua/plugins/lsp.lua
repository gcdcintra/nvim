return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim", -- Additional Lua configuration for nvim
      "hrsh7th/cmp-nvim-lsp", -- for autocompletion
    },
    config = function()
      -- Set up Mason before anything else
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

      -- Setup neodev for better Lua development (specifically for Neovim)
      require("neodev").setup()

      -- LSP settings
      local lspconfig = require("lspconfig")

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Define LSP on_attach function
      local on_attach = function(client, bufnr)
        -- Create keymaps only when an LSP attaches
        local keymap = function(mode, key, cmd, desc)
          vim.keymap.set(mode, key, cmd, { buffer = bufnr, desc = desc, noremap = true, silent = true })
        end

        -- LSP actions
        keymap("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
        keymap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        keymap("n", "gr", vim.lsp.buf.references, "Go to References")
        keymap("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
        keymap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        keymap("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
        keymap("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        keymap("n", "<leader>D", vim.lsp.buf.type_definition, "Type Definition")
        keymap("n", "<leader>d", vim.diagnostic.open_float, "Line Diagnostics")
        --[[ keymap("n", "[d", vim.diagnostic.jump( { "pos" = pos +1 } ), "Previous Diagnostic") ]]
        --[[ keymap("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic") ]]

        -- Format commands for both whole file and selection
        if client.supports_method("textDocument/formatting") then
          keymap("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, "Format Document")
        end

        -- For range formatting support
        if client.supports_method("textDocument/rangeFormatting") then
          keymap("v", "<leader>lf", function()
            vim.lsp.buf.format({
              async = true,
              range = {
                ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
              },
            })
          end, "Format Selection")
        end
      end

      -- Configure specific language servers
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- Lua
          "clangd", -- C/C++
          "diagnosticls", -- General formatter/linter
        },
        automatic_installation = true,
      })

      -- Setup all installed servers
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local server_config = {
            capabilities = capabilities,
            on_attach = on_attach,
          }

          -- Special configurations for specific servers
          if server_name == "lua_ls" then
            server_config.settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            }
          elseif server_name == "clangd" then
            server_config.capabilities.offsetEncoding = { "utf-16" }
            server_config.cmd = {
              "clangd",
              "--header-insertion=never", -- Don't automatically include headers
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
            }
          elseif server_name == "diagnosticls" then
            -- Configure diagnosticls for formatting
            server_config.filetypes = {
              "lua",
              "sh",
              "c",
              "cpp",
              "python",
              "javascript",
              "typescript",
              "css",
              "html",
              "json",
              "yaml",
              "markdown",
              "rust",
            }
            server_config.init_options = {
              linters = {
                -- Configure linters here if needed
              },
              formatters = {
                -- Lua formatter
                stylua = {
                  command = "stylua",
                  args = { "--stdin-filepath", "%filepath", "-" },
                  rootPatterns = { ".stylua.toml", "stylua.toml" },
                },
                -- C/C++ formatter
                clang_format = {
                  command = "clang-format",
                  args = { "--assume-filename=%filepath" },
                  rootPatterns = { ".clang-format" },
                },
                -- Python formatter
                black = {
                  command = "black",
                  args = { "--quiet", "--stdin-filename", "%filepath", "-" },
                },
                -- JavaScript/TypeScript formatter
                prettier = {
                  command = "prettier",
                  args = { "--stdin-filepath", "%filepath" },
                  rootPatterns = {
                    ".prettierrc",
                    ".prettierrc.json",
                    ".prettierrc.js",
                    "prettier.config.js",
                  },
                },
              },
              formatFiletypes = {
                lua = "stylua",
                c = "clang_format",
                cpp = "clang_format",
                python = "black",
                javascript = "prettier",
                typescript = "prettier",
                css = "prettier",
                html = "prettier",
                json = "prettier",
                yaml = "prettier",
                markdown = "prettier",
              },
            }
          end

          -- Setup the language server with the configuration
          lspconfig[server_name].setup(server_config)
        end,
      })

      -- Global diagnostic config
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "if_many",
          header = "",
          prefix = "",
        },
      })

      -- Custom diagnostic signs
      local signs = { Error = "! ", Warn = "W ", Hint = "󰠠 ", Info = "I " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end,
  },

  -- Formatter and Linter
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting

      -- Setup mason-null-ls
      require("mason-null-ls").setup({
        ensure_installed = {
          -- Formatters
          "stylua", -- Lua
          "clang-format", -- C/C++
          "black", -- Python
          "prettier", -- JavaScript/TypeScript/CSS/HTML
        },
        automatic_installation = true,
        handlers = {},
      })

      -- Configure formatters to support range formatting where possible
      null_ls.setup({
        debug = false,
        sources = {
          -- Formatting with range support when available
          formatting.stylua.with({
            extra_args = { "--verify" }, -- Ensure stylua verifies the code
          }),
          formatting.clang_format.with({
            extra_args = function(params)
              -- Getting start and end line for range formatting
              local range = params.range
              if range then
                return {
                  "-lines=" .. range.start.line + 1 .. ":" .. range["end"].line + 1,
                }
              end
              return {}
            end,
          }),
          formatting.black.with({
            extra_args = function(params)
              -- Black supports range formatting via the --line-ranges flag
              local range = params.range
              if range then
                return {
                  "--line-ranges=" .. range.start.line + 1 .. "-" .. range["end"].line + 1,
                }
              end
              return {}
            end,
          }),
          formatting.prettier.with({
            -- Prettier supports range formatting natively
            prefer_local = "node_modules/.bin",
          }),
        },
        -- Attach format handlers
        on_attach = function(client, bufnr)
          -- Register format capability detection
          if client.supports_method("textDocument/formatting") or client.supports_method("textDocument/rangeFormatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false, bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  },
}
