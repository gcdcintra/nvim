-- Configure Neovim providers

-- Node provider: Enable if neovim npm package is available
local node_provider_disabled = 0
if vim.fn.executable("npm") ~= 1 or vim.fn.system("npm list -g neovim 2>/dev/null | grep neovim") == "" then
  node_provider_disabled = 1
end
vim.g.loaded_node_provider = node_provider_disabled

-- Ruby provider: Enable if neovim gem is available
local ruby_provider_disabled = 0
if vim.fn.executable("ruby") ~= 1 or vim.fn.executable("gem") ~= 1 or 
   vim.fn.system("gem list -i neovim 2>/dev/null") ~= "true\n" then
  ruby_provider_disabled = 1
end
vim.g.loaded_ruby_provider = ruby_provider_disabled

-- Python3 provider: Already configured in python_provider.lua
-- Perl provider: Disabled by default
vim.g.loaded_perl_provider = 0
