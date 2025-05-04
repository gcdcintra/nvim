--[[
  File: treesitter_setup.lua
  Description: Configure tree-sitter CLI path
  
  This file helps Neovim find the tree-sitter CLI executable, which
  is needed for the :TSInstallFromGrammar command.
]]--

-- Configure path to tree-sitter CLI
-- Check common installation locations
local possible_paths = {
  -- User-level npm installation (installed by our setup script)
  vim.fn.expand("~/.npm-global/bin/tree-sitter"),
  -- System-wide installation on Arch Linux
  "/usr/bin/tree-sitter",
  -- Other common locations
  "/usr/local/bin/tree-sitter",
  vim.fn.expand("~/.local/bin/tree-sitter")
}

-- Find the first existing tree-sitter executable
for _, path in ipairs(possible_paths) do
  if vim.fn.executable(path) == 1 then
    -- Set the path for nvim-treesitter to use
    vim.g.nvim_treesitter_cli_path = path
    break
  end
end