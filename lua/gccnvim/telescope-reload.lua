local M = {}

local function inspect(v)
  print(vim.inspect(v))
  return v
end

local function reload(name)
  local reload_module = require("plenary.reload").reload_module
  reload_module(name)
  return require(name)
end

local function get_module_name(s)
    local module_name;
    module_name = s:gsub("%.lua", "")
    module_name = module_name:gsub("%/", ".")
    module_name = module_name:gsub("%.init", "")
    return module_name
end

-- Improve this
function M.reload()
  local prompt_title = " [Modules] "
  local path = "~/.config/nvim/lua"

  local opts = {
    prompt_title = prompt_title,
    cwd = path,

    attach_mappings = function(_, map)
      map("i", "<c-e>", function(_)
        local entry = require("telescope.actions.state").get_selected_entry()
        local name = get_module_name(entry.value)
        reload(name)
        inspect(name .. " RELOADED!!!")
      end)

      return true
    end
  }
  require('telescope.builtin').find_files(opts)
end

return M;

