--[[ File: lua/core/autocmds.lua
  Description: Neovim Autocommands Configuration

  This file defines various autocommands to automate tasks and enhance the
  editor's behavior based on events like file type, buffer changes, and window
  resizing.

  Autocommands are organized into logical groups for clarity and maintainability.
--]]

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Autocommands
local general = augroup("General", { clear = true })

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- Resize splits when window is resized
autocmd("VimResized", {
  group = general,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Go to last loc when opening a buffer
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close some file types with 'q'
autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto create dir when saving a file
autocmd("BufWritePre", {
  group = general,
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- Don't auto comment new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Settings for filetypes:
-- Ensure help pages open vertically
autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
})

-- Make quickfix window always take full width
autocmd("FileType", {
  pattern = "qf",
  command = "wincmd J",
})

-- Restore cursor position when reopening a file
autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd('silent! normal! g`"zv')
  end,
})
