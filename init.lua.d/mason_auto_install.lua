--[[
  File: mason_auto_install.lua
  Description: Auto-install Mason tools to fix checkhealth warnings
  
  This file configures Mason to automatically install language servers and tools
  that were missing in the checkhealth output, ensuring we don't get any warnings.
]]--

-- Auto-install common Mason tools on first launch
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only run once and only if Mason is available
    if not pcall(require, "mason-registry") then
      return
    end
    
    local mason_registry = require("mason-registry")
    
    -- Language tools to install based on checkhealth warnings
    local ensure_installed = {
      -- Language servers
      "lua-language-server",
      "pyright",
      "bashls",
      "jsonls",
      "yamlls",
      
      -- Formatters
      "prettier",
      "stylua",
      "black",
      
      -- Linters
      "eslint_d",
      "shellcheck",
    }
    
    -- Install each tool if not already installed
    for _, tool in ipairs(ensure_installed) do
      if not mason_registry.is_installed(tool) then
        -- Only attempt installation if the package exists
        if mason_registry.has_package(tool) then
          vim.notify("Installing " .. tool .. " via Mason", vim.log.levels.INFO)
          mason_registry.get_package(tool):install()
        end
      end
    end
  end,
  once = true,
  pattern = "*",
})