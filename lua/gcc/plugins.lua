local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("sbdchd/neoformat")

  use("TimUntersberger/neogit")
  use("github/copilot.vim")
  use("mbbill/undotree")

  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")
  use("ThePrimeagen/harpoon")

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  -- All the things
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("tzachar/cmp-tabnine", { run = "./install.sh" })
  use("onsails/lspkind-nvim")
  use("nvim-lua/lsp_extensions.nvim")
  use("glepnir/lspsaga.nvim")
  use("simrat39/symbols-outline.nvim")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate",
  })

  use("nvim-treesitter/playground")
  use("romgrk/nvim-treesitter-context")

  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")

  -- Colorscheme
  use("gruvbox-community/gruvbox")
  use("folke/tokyonight.nvim")

  -- Markdown
  use {'iamcco/markdown-preview.nvim'}

  if packer_bootstrap then
    require("packer").sync()
  end
end)
