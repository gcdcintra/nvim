local keymap = vim.keymap.set

local opts = { silent = true }

keymap("n", "<CR>", "", opts)
keymap("n", " ", "", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Move buffers
keymap("n", "<C-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<C-h>", ":BufferLineMovePrev<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)

-- Substitute
keymap(
    "n",
    "<leader>s",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    opts
)

-- Find and replace in all .h, .cpp files of the current directory
keymap(
    "n",
    "<leader><leader>s",
    ":argdo %s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    opts
)

keymap(
    "n",
    "<leader>cr",
    ":s/^/\\/\\/ Copyright (c) 2023 Trimble Transportation. All rights reserved. Trimble and\\r\\/\\/ the Globe \\& Triangle Logo are trademarks of Trimble Inc., registered in the\\r\\/\\/ United States Patent and Trademark Office and\\/or in other countries.\\r\\r<cr>",
    opts
)

-- Clangd switch header/implementation
keymap("n", "<space>", ":ClangdSwitchSourceHeader<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>l", "<cmd>IlluminateToggle<cr>", opts)

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

-- DAP
local dap = require "dap"
keymap("n", "<leader>db", dap.toggle_breakpoint, opts)
keymap("n", "<leader>dc", dap.continue, opts)
keymap("n", "<leader>di", dap.step_into, opts)
keymap("n", "<leader>do", dap.step_over, opts)
keymap("n", "<leader>dO", dap.step_out, opts)
keymap("n", "<leader>dr", dap.repl.toggle, opts)
keymap("n", "<leader>dl", dap.run_last, opts)
keymap("n", "<leader>dt", dap.terminate, opts)
keymap("n", "<leader>du", require("dapui").toggle, opts)

keymap("n", "<leader>cp", require("copilot.panel").open, opts)
