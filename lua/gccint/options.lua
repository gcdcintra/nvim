vim.g.perl_host_prog = "/usr/bin/perl"
vim.g.mapleader = ","
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.api.nvim_set_option_value("colorcolumn", "81,82", {})
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.cmdheight = 1
vim.opt.errorbells = false
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.isfname:append "@-@"
vim.opt.shortmess:append "c"
vim.opt.mouse = ""
vim.opt.completeopt = "menu,menuone,noselect"
