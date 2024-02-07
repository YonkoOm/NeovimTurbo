return {
	"tpope/vim-fugitive", -- Git operatiions within vim/neovim,
	config = function()
		vim.keymap.set("n", "<leader>gd", ":Gdiff<cr>")
		vim.keymap.set("n", "<leader>go", ":GBrowse<cr>")
		vim.keymap.set("n", "<leader>gb", ":G blame<cr>")
		vim.keymap.set("n", "<leader>gs", ":G<cr>")
	end,
}
