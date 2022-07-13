local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
    debug = false,
    sources = {
        -- lua
        formatting.stylua.with {
            filetypes = { "lua" },
        },

        -- cmake
        formatting.gersemi,

        diagnostics.cmake_lint.with {
            filetypes = { "cmake" },
        },

        -- Git
        diagnostics.commitlint.with {
            filetypes = { "gitcommit" },
        },

        -- Markdown
        diagnostics.write_good.with {
            filetypes = { "markdown" },
        },
        formatting.markdownlint.with {
            filetypes = { "markdown" },
        },
        diagnostics.markdownlint.with {
            filetypes = { "markdown" },
        },

        -- Python
        diagnostics.flake8.with {
            filetypes = { "python" },
        },
        formatting.black.with {
            filetypes = { "python" },
            extra_args = { "--line-length 80" },
        },
        formatting.isort.with {
            filetypes = { "python" },
        },
    },
}
