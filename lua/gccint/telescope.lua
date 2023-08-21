local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        file_ignore_patterns = {
            ".git/",
            "external",
            "node_modules",
            "build/",
            "dist",
        },
        mappings = {
            i = {
                ["<Down>"] = actions.cycle_history_next,
                ["<Up>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
    -- pickers = {
    --     find_files = {
    --         find_command = {
    --             "rg",
    --             "--files",
    --             "--no-ignore-vcs",
    --             "--hidden",
    --             "--follow",
    --             "--glob",
    --             "!.git",
    --             "--glob",
    --             "!.gitmodules",
    --             "--glob",
    --             "!.cache",
    --             "--glob",
    --         },
    --     },
    -- },
}
