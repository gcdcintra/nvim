--[[
  File: options.lua
  Description: Core Neovim options and settings

  This file configures the fundamental Vim/Neovim options that affect
  the editor's behavior and appearance. Options are organized into
  logical sections for easier maintenance.
--]]

local opt = vim.opt -- Shorthand for vim.opt

-------------------------------------------------------------------------------
-- Visual Settings
-------------------------------------------------------------------------------

-- Line Numbers
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers for easier jumps

-- Cursor & Line Highlighting
opt.cursorline = true -- Highlight the current line
opt.scrolloff = 8 -- Keep 8 lines above/below cursor when scrolling
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor when scrolling horizontally

-- Visual Appearance
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.signcolumn = "yes" -- Always show the sign column to avoid shifting
opt.background = "dark" -- Use dark mode
opt.wrap = false -- Disable line wrapping

-------------------------------------------------------------------------------
-- Editing Behavior
-------------------------------------------------------------------------------

-- Indentation
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Number of spaces for each step of autoindent
opt.expandtab = true -- Convert tabs to spaces
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.smartindent = true -- Smart auto-indenting when starting a new line

-- Search
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override 'ignorecase' when pattern has upper case
opt.hlsearch = true -- Highlight all matches of search pattern
opt.incsearch = true -- Show matches as you type

-- Text Manipulation
opt.backspace = "indent,eol,start" -- Allow backspace over autoindent, line breaks, start of insert
opt.iskeyword:append("-") -- Treat hyphenated words as a single word

-------------------------------------------------------------------------------
-- System & File Handling
-------------------------------------------------------------------------------

-- Clipboard
opt.clipboard:append("unnamed") -- Use system clipboard

-- File Management
opt.swapfile = false -- Don't create swapfiles
opt.backup = false -- Don't create backup files
opt.undofile = true -- Enable persistent undo (store undo history between sessions)

-- Window Management
opt.splitright = true -- Open vertical splits to the right
opt.splitbelow = true -- Open horizontal splits below

-------------------------------------------------------------------------------
-- Performance & UI
-------------------------------------------------------------------------------

-- Editor Responsiveness
opt.updatetime = 50 -- Faster completion and less lag (default: 4000ms)
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (ms)

-- UI Elements
opt.completeopt = "menuone,noselect" -- Better completion experience
opt.hidden = true -- Allow switching buffers without saving

-- Disable mouse
opt.mouse = ""
