-- Auto-install common Mason tools on first launch
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local mason_registry = require("mason-registry")
    
    -- Common language servers and tools to install
    local ensure_installed = {
      -- LSP servers
      "lua-language-server",
      "pyright",
      "typescript-language-server",
      "bash-language-server",
      
      -- Formatters
      "prettier",
      "stylua",
      "black",
      
      -- Linters
      "eslint_d",
      "shellcheck",
    }
    
    -- Ensure Mason is loaded first
    if not pcall(require, "mason") then
      return
    end
    
    -- Install each tool if not already installed
    for _, tool in ipairs(ensure_installed) do
      if not mason_registry.is_installed(tool) then
        vim.notify("Installing " .. tool .. " via Mason", vim.log.levels.INFO)
        mason_registry.get_package(tool):install()
      end
    end
  end,
  once = true,
})
