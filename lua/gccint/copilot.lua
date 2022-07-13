require("copilot").setup {
    panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
            jump_prev = "<M-[>",
            jump_next = "<M-]>",
            accept = "<CR>",
            refresh = "<leader>cr",
        },
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 50,
        keymap = {
            accept = "<C-s>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-e>",
        },
    },
    filetypes = {
        ["*"] = true,
    },
    copilot_node_command = "node", -- Node version must be < 18
    plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
    server_opts_overrides = {},
}
