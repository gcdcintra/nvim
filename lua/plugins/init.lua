--[[
  File: plugins/init.lua
  Description: Base plugin configuration and plugin index

  This file serves as the entry point for the plugins directory.
  It returns base plugins and ensures that all plugin files are properly loaded.
--]]

-- Return a table of base/core plugins that don't need their own dedicated files
-- Other plugins are automatically loaded by lazy.nvim from this directory
return {
  -- Core plugins can be added here if needed
  -- Example: { "plugin/repo", lazy = true }

  -- This empty table ensures init.lua is a valid module
  -- All other plugins are loaded from their respective files
}
