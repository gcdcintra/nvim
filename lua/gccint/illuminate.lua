vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
vim.api.nvim_set_keymap(
    "n",
    "<C-f>",
    '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
    { noremap = false }
)
vim.api.nvim_set_keymap(
    "n",
    "<C-b>",
    '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
    { noremap = false }
)
