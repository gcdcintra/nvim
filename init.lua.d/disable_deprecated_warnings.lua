-- Disable deprecated warnings for plugins using vim.validate
vim.deprecate = function(name, alternative, version, plugin)
  -- Silent deprecation warnings
  return name
end

-- Configure lazy.nvim rocks to false to avoid luarocks warnings
vim.g.lazy_rocks_disabled = true

-- Configure providers - disable unused ones to avoid warnings
vim.g.loaded_perl_provider = 0
