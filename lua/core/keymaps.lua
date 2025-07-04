--[[
  File: keymaps.lua
  Description: Core keymaps configuration

  This file contains the configuration for all core keymaps in Neovim.

  Keymaps are organized into logical sections:
  - General keymaps
  - Window navigation and resizing
  - Buffer navigation and management
  - Visual mode operations
  - Text manipulation
  - Clipboard operations with leader prefix
  - Leader key commands (organized for which-key integration)
  - Telescope integration
  - Git operations

  Each keymap includes a descriptive label for which-key integration and inline
  documentation explaining its purpose.
--]]

local keymap = vim.keymap.set

-- Helper function for better keymap organization
local function map(mode, lhs, rhs, desc)
  keymap(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

-- =============================================
-- General keymaps
-- =============================================

-- ----------------
-- Window Navigation
-- ----------------
-- Navigate between windows using Ctrl + hjkl (vim-style movement keys)
map("n", "<C-h>", "<C-w>h", "Navigate to the left window")
map("n", "<C-k>", "<C-w>k", "Navigate to the window above")
map("n", "<C-j>", "<C-w>j", "Navigate to the window below")
map("n", "<C-l>", "<C-w>l", "Navigate to the right window")

-- Terminal window navigation - allows same navigation keys while in terminal mode
map("t", "<C-h>", function()
  vim.cmd("wincmd h")
end, "Terminal: navigate to the left window")
map("t", "<C-j>", function()
  vim.cmd("wincmd j")
end, "Terminal: navigate to the window below")
map("t", "<C-k>", function()
  vim.cmd("wincmd k")
end, "Terminal: navigate to the window above")
map("t", "<C-l>", function()
  vim.cmd("wincmd l")
end, "Terminal: navigate to the right window")

-- ----------------
-- Window Resizing
-- ----------------
-- Resize windows with Ctrl + Arrow keys
map("n", "<C-Up>", function()
  vim.cmd("resize -2")
end, "Decrease window height by 2 units")
map("n", "<C-Down>", function()
  vim.cmd("resize +2")
end, "Increase window height by 2 units")
map("n", "<C-Left>", function()
  vim.cmd("vertical resize -2")
end, "Decrease window width by 2 units")
map("n", "<C-Right>", function()
  vim.cmd("vertical resize +2")
end, "Increase window width by 2 units")

-- Terminal window resizing - allows same resize keys while in terminal mode
map("t", "<C-Up>", function()
  vim.cmd("resize -2")
end, "Terminal: decrease window height by 2 units")
map("t", "<C-Down>", function()
  vim.cmd("resize +2")
end, "Terminal: increase window height by 2 units")
map("t", "<C-Left>", function()
  vim.cmd("vertical resize -2")
end, "Terminal: decrease window width by 2 units")
map("t", "<C-Right>", function()
  vim.cmd("vertical resize +2")
end, "Terminal: increase window width by 2 units")

-- =============================================
-- Buffer navigation
-- =============================================

-- Quick buffer navigation without needing leader key
map("n", "<S-l>", function()
  vim.cmd("bnext")
end, "Go to next buffer")
map("n", "<S-h>", function()
  vim.cmd("bprevious")
end, "Go to previous buffer")

-- =============================================
-- Text manipulation
-- =============================================

-- Stay in visual mode after changing indentation
map("v", "<", "<gv", "Unindent selected text and maintain selection")
map("v", ">", ">gv", "Indent selected text and maintain selection")

-- Move selected text up and down in visual mode
map("v", "J", function()
  vim.cmd("'<,'>move '>+1")
end, "Move selected block down one line")
map("v", "K", function()
  vim.cmd("'<,'>move '<-2")
end, "Move selected block up one line")

-- Paste without overwriting register content
map("v", "p", '"_dP', "Paste over selection without yanking it")

-- =============================================
-- LSP keymaps
-- =============================================
map("n", "<M-e>", vim.lsp.buf.declaration, "LSP: Go to declaration")
map("n", "<M-w>", vim.lsp.buf.definition, "LSP: Go to definition")
map("n", "<M-s>", function()
  vim.cmd("ClangdSwitchSourceHeader")
end, "LSP: Switch header/source")
map("n", "<M-d>", function()
  vim.lsp.buf.references()
  vim.cmd("Telescope lsp_references")
end, "LSP: Find all uses and send to quickfix")

-- ---------------
-- View Centering
-- ---------------
-- Center view after navigation commands for better context
map("n", "<C-d>", "<C-d>zz", "Move half page down and center view")
map("n", "<C-u>", "<C-u>zz", "Move half page up and center view")
map("n", "n", "nzzzv", "Go to next search result and center view")
map("n", "N", "Nzzzv", "Go to previous search result and center view")
map("n", "J", "mzJ`z", "Join line below and maintain cursor position")

-- =============================================
-- Clipboard operations
-- =============================================

-- Clipboard copy operations with leader prefix
map("n", "<leader>y", '"+y', "Copy to system clipboard")
map("n", "<leader>Y", '"+y$', "Copy to end of line to system clipboard")
map("v", "<leader>y", '"+y', "Copy selection to system clipboard")
map("n", "<leader>yy", '"+yy', "Copy current line to system clipboard")

-- Clipboard paste operations with leader prefix
map("n", "<leader>p", '"+p', "Paste from system clipboard after cursor")
map("n", "<leader>P", '"+P', "Paste from system clipboard before cursor")
map("v", "<leader>p", '"+p', "Paste from system clipboard over selection")

-- =============================================
-- Leader key mappings (for which-key)
-- =============================================

-- Configuration reload
local utils_loaded, utils = pcall(require, "core.utils")
if utils_loaded then
  map("n", "<leader>cr", function()
    utils.reload_config()
  end, "Reload Neovim configuration")
end

-- ---------------
-- Buffer Operations
-- ---------------
-- Consistent 'b' prefix for buffer operations
map("n", "<leader>bd", function()
  vim.cmd("bdelete")
end, "Delete current buffer")

map("n", "<leader>bl", function()
  vim.cmd("buffers")
end, "List all open buffers")

-- ---------------
-- UI Toggles
-- ---------------
map("n", "<leader>th", function()
  vim.cmd("nohlsearch")
end, "Turn off search highlighting")

map("n", "<leader>tn", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, "Toggle relative line numbers")

-- =============================================
-- Telescope mappings
-- =============================================
local telescope_loaded, telescope = pcall(require, "telescope")
if telescope_loaded then
  local builtin = require("telescope.builtin")

  -- ---------------
  -- File Navigation
  -- ---------------
  map("n", "<leader>ff", function()
    builtin.find_files()
  end, "Find files in project")

  map("n", "<leader>fa", function()
    builtin.find_files({ follow = true, no_ignore = true, hidden = true })
  end, "Find all files including hidden and ignored")

  map("n", "<leader>fg", function()
    builtin.live_grep()
  end, "Find text in project files")

  map("n", "<leader>fb", function()
    builtin.buffers()
  end, "Find and switch between open buffers")

  map("n", "<leader>fh", function()
    builtin.help_tags()
  end, "Find help documentation")

  map("n", "<leader>fo", function()
    builtin.oldfiles()
  end, "Find recently opened files")

  map("n", "<leader>fc", function()
    builtin.colorscheme()
  end, "Find and switch colorscheme")

  map("n", "<leader>fr", function()
    builtin.resume()
  end, "Resume previous telescope search")

  -- ---------------
  -- Git Operations
  -- ---------------
  map("n", "<leader>gc", function()
    builtin.git_commits()
  end, "Browse git commits")

  map("n", "<leader>gs", function()
    builtin.git_status()
  end, "Browse git status of files")

  map("n", "<leader>gb", function()
    builtin.git_branches()
  end, "Browse and switch git branches")

  -- ---------------
  -- Additional Telescope Features
  -- ---------------
  map("n", "<leader>fm", function()
    builtin.marks()
  end, "Browse marks")

  map("n", "<leader>fk", function()
    builtin.keymaps()
  end, "Browse all configured keymaps")

  -- Projects extension (if available)
  pcall(function()
    map("n", "<leader>fp", function()
      telescope.extensions.project.project()
    end, "Browse saved projects")
  end)

  -- File browser extension (if available)
  pcall(function()
    map("n", "<leader>fe", function()
      telescope.extensions.file_browser.file_browser()
    end, "Browse files with file browser")
  end)
else
  vim.notify("Telescope not loaded when setting up keymaps", vim.log.levels.WARN)
end

-- =============================================
-- Git mappings (enhanced with Neogit)
-- =============================================
-- Register additional git commands for which-key
local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
  wk.add({
    { "<leader>g", name = "Git" },
    { "<leader>gs", name = "Git Status" },
    { "<leader>gc", name = "Git Commit/Conflict" },
    { "<leader>gb", name = "Git Branch" },
    { "<leader>gp", name = "Git Pull/Push" },
    { "<leader>gl", name = "Git Links" },
    { "<leader>h", name = "Hunks" },
    { "<leader>y", name = "Copy to clipboard" },
    { "<leader>p", name = "Paste from clipboard" },
  })
end

-- Setup Git keymaps only if we're in a git repository
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Check if we're in a git repo
    local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null") == "true\n"
    if is_git_repo then
      -- Additional git keymaps that depend on being in a git repo
      map("n", "<leader>gB", function()
        local branch_name = vim.fn.system("git branch --show-current"):gsub("\n", "")
        vim.fn.setreg("+", branch_name)
        vim.notify('Branch name "' .. branch_name .. '" copied to clipboard', vim.log.levels.INFO)
      end, "Copy branch name")
    end
  end,
  once = true,
})

-- Lazygit integration (if installed)
if vim.fn.executable('lazygit') == 1 then
  map("n", "<leader>gg", function()
    vim.cmd("terminal lazygit")
    vim.cmd("startinsert")  -- Start in insert mode for terminal
  end, "Launch Lazygit")
end
