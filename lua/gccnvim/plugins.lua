return require('packer').startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-telescope/telescope-symbols.nvim'},
        }
    }

    -- Harpoon navigation
    use("ThePrimeagen/harpoon")

    -- Copilot
    use("github/copilot.vim")

    -- Lspconfig
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use { 'tzachar/cmp-tabnine',
        run = './install.sh',
        requires = 'hrsh7th/nvim-cmp'
    }
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- ClangdExtensions
    use("p00f/clangd_extensions.nvim")

    -- Colorscheme
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")
end)
