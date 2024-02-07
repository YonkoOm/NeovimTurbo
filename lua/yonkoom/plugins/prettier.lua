return {
	"MunifTanjim/prettier.nvim",
	config = function()
		require("prettier").setup({
			bin = "prettierd",
			filetypes = {
				"css",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"html",
				"rust",
				"python",
				"java",
				"json",
				"scss",
				"less",
			},
		})
	end,
}
