--[[
  File: telescope.lua
  Description: Telescope fuzzy finder configuration

  This file configures the telescope.nvim plugin, which provides fuzzy finding capabilities.
  Configuration includes:
  - Default settings for UI appearance and behavior
  - Mappings for telescope operations
  - Extensions configuration (fzf, ui-select, projects, file_browser)

  Requires:
  - plenary.nvim for Lua utilities
  - telescope-fzf-native for better performance
  - telescope-ui-select for better UI
  - nvim-web-devicons for file icons
  - telescope-project.nvim for project management
  - telescope-file-browser.nvim for file browsing
--]]

return {
  "nvim-telescope/telescope.nvim",
  lazy = false, -- Load at startup instead of on command
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
    -- Add project extension
    {
      "nvim-telescope/telescope-project.nvim",
    },
    -- Add file browser extension
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local themes = require("telescope.themes")

    telescope.setup({
      defaults = {
        -- Use a simple selection indicator that won't affect indentation
        selection_caret = "▶ ",
        prompt_prefix = " 󰭎 ",
        entry_prefix = "  ", -- Consistent spacing for unselected entries
        
        initial_mode = "insert",
        selection_strategy = "reset",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        
        -- Make sure the layout settings are consistent
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.60,  -- Increasing preview width for better file viewing
            results_width = 0.40,  -- Adjusting results width accordingly
            width = 0.92,          -- Wider overall window
            height = 0.85,         -- Taller window for better visibility
            preview_cutoff = 120,
          },
          vertical = {
            mirror = false,
            width = 0.90,         -- Consistent width in vertical layout
            height = 0.85,        -- Consistent height in vertical layout
            preview_height = 0.60, -- Preview takes more space in vertical mode
          },
          width = 0.92,           -- Overall wider window
          height = 0.85,          -- Overall taller window
        },
        
        -- Improved borders for a cleaner look
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        
        file_ignore_patterns = {
          ".git/",
          "node_modules/",
          "target/",
          "docs/",
        },
        
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-h>"] = actions.which_key,
          },
          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["?"] = actions.which_key,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },
      
      -- Configure specific pickers with consistent displays
      pickers = {
        find_files = {
          -- Remove the dropdown theme to use the default horizontal layout
          -- theme = "dropdown",
          hidden = true,
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          previewer = true, -- Enable the previewer for file picker
          layout_config = {
            -- Additional specific settings just for find_files
            width = 0.92,
            height = 0.85,
            preview_width = 0.60,
          },
        },
        live_grep = {
          additional_args = { "--hidden" },
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
          show_all_buffers = true,
          sort_lastused = true,
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer,
            },
            n = {
              ["<c-d>"] = actions.delete_buffer,
            },
          },
        },
        help_tags = {
          show_version = true,
        },
      },
      
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          themes.get_dropdown({}),
        },
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            ["i"] = {},
            ["n"] = {},
          },
        },
        project = {
          base_dirs = {
            { path = "~/work", max_depth = 4 },
          },
          hidden_files = true,
          theme = "dropdown",
          order_by = "asc",
          search_by = "title",
          sync_with_nvim_tree = true,
        },
      },
    })

    -- Load extensions
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")
    pcall(telescope.load_extension, "file_browser")
    pcall(telescope.load_extension, "project")
  end,
}
