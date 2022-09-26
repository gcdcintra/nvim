local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
        prompt_prefix = " $ ",
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
            }
        }
	}
})

local M = {}

M.fzz_current_buffer = function()
    local opt = require('telescope.themes').get_dropdown({
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        winblend = 10,
        border = true,
        shorten_path = false,
        sorting_strategy = "ascending",
        layout_strategy = 'horizontal',
        cursorline = true,
        layout_config = {
            width = 0.9,
            height = 0.9,
            prompt_position = 'top',
            preview_cutoff = 120,
        },
    })
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

return M
