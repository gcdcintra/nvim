--[[
  File: provider_setup.lua
  Description: Correctly configure Neovim providers

  This file configures provider settings to fix health check issues.
  It properly sets up the Node.js provider and disables unneeded providers.
]]

-- Fix Node.js provider configuration
-- Setting to 0 properly disables a provider, setting to 1 causes errors
vim.g.loaded_node_provider = 0 -- Properly disable Node.js provider

-- Optionally disable other providers you don't need
vim.g.loaded_perl_provider = 0 -- Disable Perl provider
vim.g.loaded_ruby_provider = 0 -- Disable Ruby provider
