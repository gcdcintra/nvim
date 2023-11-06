local keymap = vim.keymap.set

local opts = { silent = true }

keymap("n", "<CR>", "", opts)
keymap("n", " ", "", opts)

-- Window navigation.
keymap("n", "<M-z>", "<C-w>q", opts)
keymap("n", "<M-v>", "<C-w>v", opts)
keymap("n", "<M-b>", "<C-w>s", opts)
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-j>", "<C-w>j", opts)
keymap("n", "<M-k>", "<C-w>k", opts)
keymap("n", "<M-l>", "<C-w>l", opts)

-- Window resizing.
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Buffer motions.
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<C-h>", ":BufferLineMovePrev<CR>", opts)

-- Substitute selected text the pasted text.
keymap("v", "p", '"_dP', opts)

-- Indent selected lines and stay in indent mode.
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)

-- Substitute word under cursor in the current file.
keymap(
    "n",
    "<leader>s",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    opts
)

-- Find and replace in all .h, .cpp files of the current directory.
keymap(
    "n",
    "<leader><leader>s",
    ":argdo %s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    opts
)

-- TODO: Find a better way to do this.
keymap(
    "n",
    "<leader>cr",
    ":s/^/\\/\\/ Copyright (c) 2023 Trimble Transportation. All rights reserved. Trimble and\\r\\/\\/ the Globe \\& Triangle Logo are trademarks of Trimble Inc., registered in the\\r\\/\\/ United States Patent and Trademark Office and\\/or in other countries.\\r\\r<cr>",
    opts
)

-- Clangd switch header/implementation
keymap("n", "<space>", ":ClangdSwitchSourceHeader<CR>", opts)

-- NvimTree
-- keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
-- keymap("n", "<leader>l", "<cmd>IlluminateToggle<cr>", opts)

-- keymap("i", "<leader>cp", require("copilot.panel").open, opts)

-- Telescope
keymap("n", "<BS>f", require("telescope.builtin").find_files, opts)
keymap("n", "<BS>g", require("telescope.builtin").live_grep, opts)
keymap("n", "<BS>b", require("telescope.builtin").buffers, opts)
keymap("n", "<BS>p", require("telescope.builtin").git_files, opts)

-- Git
keymap("n", "<leader>gs", "<cmd>Neogit<cr>", opts)

-- Comment
keymap("n", "<C-_>", require("Comment.api").toggle.linewise.current, opts)
keymap("x", "<C-_>", function()
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, opts)
