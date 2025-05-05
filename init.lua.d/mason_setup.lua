-- Ensure Mason is loaded first
if not pcall(require, "mason") then
  return
end

-- Auto-install common Mason tools on first launch
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only run once and only if Mason is available
    if not pcall(require, "mason-registry") then
      return
    end

    local mason_registry = require("mason-registry")

    -- Language tools to install based on checkhealth warnings with correct Mason package names
    local ensure_installed = {
      -- Language servers
      "lua-language-server",
      "pyright",
      "bash-language-server",
      "json-lsp",
      "yaml-language-server",
      "typescript-language-server",
      "clangd",
      "diagnostic-languageserver",

      -- Formatters
      "prettier",
      "stylua",
      "black",
      "clang-format",

      -- Linters
      "eslint_d",
      "shellcheck",
    }

    -- Install each tool if not already installed
    for _, tool in ipairs(ensure_installed) do
      local success, package = pcall(mason_registry.get_package, tool)
      if not success then
        vim.notify("Mason package not found: " .. tool, vim.log.levels.WARN)
      else
        if not mason_registry.is_installed(tool) then
          vim.notify("Installing " .. tool .. " via Mason", vim.log.levels.INFO)

          -- Install with error handling
          local install_success, install_err = pcall(function()
            package:install()
          end)

          if not install_success then
            vim.notify("Failed to install " .. tool .. ": " .. tostring(install_err), vim.log.levels.ERROR)
          end
        end
      end
    end
  end,
  once = true,
  pattern = "*",
})
