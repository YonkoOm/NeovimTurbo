return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"c",
				"typescript",
				"javascript",
				"typescriptreact",
				"html",
				"htmlangular",
				"python",
				"fish",
				"lua",
				"markdown",
				"css",
				"scss",
				"cpp",
				"java",
				"rust",
			},
			callback = function()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.treesitter.start()
			end,
		})

		ts.install({
			"c",
			"lua",
			"tsx",
			"javascript",
			"typescript",
			"html",
			"angular",
			"python",
			"cpp",
			"fish",
			"json",
			"markdown",
			"markdown_inline",
			"css",
			"scss",
			"java",
			"rust",
		})

		require("ts_context_commentstring").setup({})
	end,
}
