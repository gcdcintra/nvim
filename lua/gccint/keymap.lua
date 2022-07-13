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
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

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
keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

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
keymap("n", "<leader>db", require("dap").toggle_breakpoint, opts)
keymap("n", "<leader>dc", require("dap").continue, opts)
keymap("n", "<leader>di", require("dap").step_into, opts)
keymap("n", "<leader>do", require("dap").step_over, opts)
keymap("n", "<leader>dO", require("dap").step_out, opts)
keymap("n", "<leader>dr", require("dap").repl.toggle, opts)
keymap("n", "<leader>dl", require("dap").run_last, opts)
keymap("n", "<leader>du", require("dapui").toggle, opts)
keymap("n", "<leader>dt", require("dap").terminate, opts)

keymap("n", "<leader>cp", require("copilot.panel").open, opts)
