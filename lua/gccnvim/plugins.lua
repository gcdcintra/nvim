return require('packer').startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- Telescope
    use { 'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-telescope/telescope-symbols.nvim'},
            {'kyazdani42/nvim-web-devicons'}
        }
    }

    -- Harpoon navigation
    use("ThePrimeagen/harpoon")

    -- Copilot
    use("github/copilot.vim")

    -- Colorscheme
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")
end)
