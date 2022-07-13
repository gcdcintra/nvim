local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    -- packer itself
    use "wbthomason/packer.nvim"

    use "nvim-lua/plenary.nvim"
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/toggleterm.nvim"
    use "lewis6991/impatient.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "mattn/webapi-vim"
    use "TimUntersberger/neogit"
    use "saecki/crates.nvim"

    -- colorschemes
    use "folke/tokyonight.nvim"
    use "rose-pine/neovim"
    use { "catppuccin/nvim", as = "catppuccin" }

    -- lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "RRethy/vim-illuminate"
    use "jose-elias-alvarez/null-ls.nvim"
    use "folke/neodev.nvim"
    use "p00f/clangd_extensions.nvim"

    -- diagnosticsls-configs
    use {
        "creativenull/diagnosticls-configs-nvim",
        requires = { "neovim/nvim-lspconfig" },
    }

    -- completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "onsails/lspkind.nvim"

    -- copilot
    use { "zbirenbaum/copilot.lua" }

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- rust-tools
    use "simrat39/rust-tools.nvim"

    -- telescope
    use "nvim-telescope/telescope.nvim"

    -- treesitter
    use "nvim-treesitter/nvim-treesitter"

    -- git
    use "lewis6991/gitsigns.nvim"

    -- nvim-dap
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- latex
    use "lervag/vimtex"

    -- markdown
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    }

    -- distant
    use "chipsenkbeil/distant.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
