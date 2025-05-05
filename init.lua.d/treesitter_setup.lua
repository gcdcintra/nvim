--[[
  File: treesitter_setup.lua
  Description: Configure tree-sitter CLI path

  This file helps Neovim find the tree-sitter CLI executable, which
  is needed for the :TSInstallFromGrammar command.
]]
--

local possible_paths = {
  "/usr/bin/tree-sitter",
  "/usr/local/bin/tree-sitter",
  vim.fn.expand("~/.npm-global/bin/tree-sitter"),
  vim.fn.expand("~/.local/bin/tree-sitter"),
}

-- Find the first existing tree-sitter executable
for _, path in ipairs(possible_paths) do
  if vim.fn.executable(path) == 1 then
    vim.g.nvim_treesitter_cli_path = path
    break
  end
end
