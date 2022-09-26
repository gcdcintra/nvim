local Remap = require("gccnvim.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap
local nmap = Remap.nmap

-- Redo
nnoremap("<leader>uu", ":redo<CR>")

-- Smooth scrolling
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Move line up/down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Move bellow line up
nnoremap("J", "mzJ`z")

-- Copy stuff
nnoremap("Y", "yg$")
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

-- Delete without yank
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- Tmux sessionizer
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Substitute with regex
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Give current file +x
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Toogle b:copilot_enabled between v:true and v:false
nnoremap("<leader>ce", "<cmd>let b:copilot_enabled = v:true<CR>")
