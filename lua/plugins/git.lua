return {
  -- Git signs (shows changes in the gutter)
  {
    "lewis6991/gitsigns.nvim", -- Git decorations
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▁" },
        topdelete = { text = "▔" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Next Git hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Previous Git hunk" })

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage Hunk" })
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset Hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, { desc = "Blame Line" })
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle Line Blame" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Diff This" })
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "Diff This ~" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle Deleted" })
      end,
      current_line_blame = false, -- Toggle with '<leader>tb'
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      preview_config = {
        -- Options passed to nvim_open_win
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
  },

  -- Neogit - Magit-like interface for Git
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required dependency
      "sindrets/diffview.nvim", -- Optional but recommended for enhanced diff view
      "nvim-telescope/telescope.nvim", -- Optional: for commit and branch fuzzy search
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
      { "<leader>gc", "<cmd>Neogit commit<CR>", desc = "Neogit Commit" },
      { "<leader>gp", "<cmd>Neogit pull<CR>", desc = "Neogit Pull" },
      { "<leader>gP", "<cmd>Neogit push<CR>", desc = "Neogit Push" },
    },
    opts = {
      integrations = {
        diffview = true, -- Enable diffview.nvim integration
        telescope = true, -- Enable telescope integration
      },
      -- Disable remember_settings to avoid potential conflicts
      remember_settings = false,
      -- Customize some common commands for speed
      commit_popup = {
        kind = "split", -- or "split" or "tab"
      },
      -- Customize the signs for each git status
      signs = {
        -- { CLOSED, OPENED }
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
      -- Automatically refresh on file changes
      auto_refresh = true,
      -- Syntax highlighting inside git commits
      use_telescope = true,
    },
  },

  -- Git conflict resolution
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    cmd = {
      "GitConflictChooseOurs",
      "GitConflictChooseTheirs",
      "GitConflictChooseBoth",
      "GitConflictChooseNone",
      "GitConflictNextConflict",
      "GitConflictPrevConflict",
      "GitConflictListQf",
    },
    keys = {
      { "<leader>gco", "<cmd>GitConflictChooseOurs<CR>", desc = "Git Choose Ours" },
      { "<leader>gct", "<cmd>GitConflictChooseTheirs<CR>", desc = "Git Choose Theirs" },
      { "<leader>gcb", "<cmd>GitConflictChooseBoth<CR>", desc = "Git Choose Both" },
      { "<leader>gcn", "<cmd>GitConflictChooseNone<CR>", desc = "Git Choose None" },
      { "]x", "<cmd>GitConflictNextConflict<CR>", desc = "Next Git Conflict" },
      { "[x", "<cmd>GitConflictPrevConflict<CR>", desc = "Previous Git Conflict" },
    },
    opts = {
      default_mappings = false,
      default_commands = true,
      disable_diagnostics = false,
      highlights = {
        incoming = "DiffAdd",
        current = "DiffText",
      },
    },
  },

  -- Improved GitHub URL handler
  {
    "9seconds/repolink.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gl", "<cmd>RepoLink<CR>", mode = { "n", "v" }, desc = "Get GitHub Link" },
      { "<leader>gL", "<cmd>RepoLink!<CR>", mode = { "n", "v" }, desc = "Get GitHub Link with Line Number" },
    },
    opts = {}, -- Uses defaults which work with GitHub, GitLab, Bitbucket
  },
}
