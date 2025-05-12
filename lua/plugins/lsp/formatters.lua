-- File: plugins/lsp/formatters.lua
-- Description: Formatters configuration for Neovim

local M = {}

function M.setup()
  local none_ls = require('none-ls')
  none_ls.setup({
    sources = {
      none_ls.builtins.formatting.black, -- Python
      none_ls.builtins.formatting.shfmt, -- Bash/Zsh
      none_ls.builtins.formatting.clang_format, -- C/C++
      none_ls.builtins.formatting.stylua, -- Lua
    },
  })
end

return M
