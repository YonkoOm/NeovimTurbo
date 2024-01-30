local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	-- Color Schemes
	use("folke/tokyonight.nvim")
	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "rose-pine/neovim", as = "rose-pine" })
	use("bluz71/vim-nightfly-guicolors")
	use("rebelot/kanagawa.nvim")

	use("wbthomason/packer.nvim")
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/nvim-cmp") -- Completion
	use("neovim/nvim-lspconfig") -- LSP
	use("nvimtools/none-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("numToStr/Comment.nvim")
	use("nvimdev/dashboard-nvim")
	use("mbbill/undotree")

	use("nvimdev/lspsaga.nvim") -- LSP UIs
	use("L3MON4D3/LuaSnip")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("norcalli/nvim-colorizer.lua")
	use("folke/zen-mode.nvim")
	use("iamcco/markdown-preview.nvim")
	use("akinsho/nvim-bufferline.lua")
	use("tpope/vim-fugitive") -- Git operatiions within vim/neovim
	use("tpope/vim-rhubarb") -- Enables the ability to open GitHub URLs directly from vim/neovim
	use("lewis6991/gitsigns.nvim")
end)
