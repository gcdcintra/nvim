local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    "jacquesg/p5-Neovim-Ext",
    "nvim-lua/plenary.nvim",
    "windwp/nvim-autopairs",
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "kyazdani42/nvim-web-devicons",
    "moll/vim-bbye",
    "akinsho/bufferline.nvim",
    "nvim-lualine/lualine.nvim",
    "akinsho/toggleterm.nvim",
    "lukas-reineke/indent-blankline.nvim",
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
        },
        config = true,
    },

    -- Themes
    "folke/tokyonight.nvim",
    "rose-pine/neovim",
    { "catppuccin/nvim", name = "catppuccin" },

    -- LSP/Completion/Linting stuff
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "RRethy/vim-illuminate",
    "jose-elias-alvarez/null-ls.nvim",
    "folke/neodev.nvim",
    "p00f/clangd_extensions.nvim",
    {
        "creativenull/diagnosticls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    "zbirenbaum/copilot.lua",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "simrat39/rust-tools.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "lewis6991/gitsigns.nvim",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
    },
    "lervag/vimtex",
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}
