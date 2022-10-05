local Remap = require("gcc.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local nmap = Remap.nmap

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>uu", ":redo<CR>")

-- Smooth scrolling
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Move line up/down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Delete line below
nnoremap("J", "mzJ`z")

-- Copy stuff
nnoremap("Y", "yg$")
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')

-- Delete without yank
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- Tmux sessionizer
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Substitute with regex
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Give current file +x
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Copilot
nnoremap("<leader>ce", "<cmd>let b:copilot_enabled = v:true<CR>")
nnoremap("<leader>cd", "<cmd>let b:copilot_enabled = v:false<CR>")

-- Save and source current file
nnoremap("<leader><leader>s", "<cmd>write<CR><cmd>source %<CR>")

-- Create tab buffers
nnoremap("<space>n", "<cmd>tabnew<CR>")
nnoremap("<space>o", "<cmd>tabonly<CR>")
nnoremap("<space>q", "<cmd>tabclose<CR>")
nnoremap("<space>l", "<cmd>tabnext<CR>")
nnoremap("<space>h", "<cmd>tabprevious<CR>")
nnoremap("<space>b", "<cmd>tabedit<CR><cmd>tabdo bnext<CR>")
nnoremap("<space>d", "<cmd>tabdo bd<CR>")

-- DAP stuff
nnoremap("<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
nnoremap("<leader>dc", "<cmd>lua require('dap').continue()<CR>")
nnoremap("<leader>di", "<cmd>lua require('dap').step_into()<CR>")
nnoremap("<leader>do", "<cmd>lua require('dap').step_over()<CR>")
nnoremap("<leader>du", "<cmd>lua require('dap').step_out()<CR>")
nnoremap("<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")
nnoremap("<leader>dl", "<cmd>lua require('dap').run_last()<CR>")
nnoremap("<leader>ds", "<cmd>lua require('dap').disconnect(); require('dap').run_last()<CR>")

-- Autosave toggle
nnoremap("<leader>ab", "<cmd>lua require('gcc.autosave').toggle_cpp_build()<CR>")
nnoremap("<leader>af", "<cmd>lua require('gcc.autosave').toogle_autoformat()<CR>")
