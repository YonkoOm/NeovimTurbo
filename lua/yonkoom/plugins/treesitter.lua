return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter.configs")

		ts.setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"tsx",
				"javascript",
				"typescript",
				"html",
				"css",
				"lua",
				"java",
				"c",
				"cpp",
				"rust",
				"python",
				"fish",
				"json",
				"markdown",
				"markdown_inline",
			},
		})

		require("ts_context_commentstring").setup({})
	end,
}
