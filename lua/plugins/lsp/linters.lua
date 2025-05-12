-- File: plugins/lsp/linters.lua
-- Description: Linters configuration for Neovim

local M = {}

function M.setup()
  local none_ls = require('none-ls')
  none_ls.setup({
    sources = {
      none_ls.builtins.diagnostics.flake8, -- Python
      none_ls.builtins.diagnostics.shellcheck, -- Bash/Zsh
    },
  })
end

return M
