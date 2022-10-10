local nnoremap = require("gcc.keymap").nnoremap

function ContextSetup(show_all_context)
  require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    show_all_context = show_all_context,
  })
end

nnoremap("<leader>ce", function()
  ContextSetup(true)
end)

nnoremap("<leader>cd", function()
  ContextSetup(false)
end)

ContextSetup(true)
