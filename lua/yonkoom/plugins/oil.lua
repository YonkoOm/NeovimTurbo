return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = { "icon" },
			view_options = {
				show_hidden = true,
			},
			float = {
				preview_split = "right",
			},
		})

		vim.keymap.set("n", "<leader>-", "<Cmd>Oil<CR>", { desc = "Open Parent Directory " })
		vim.keymap.set("n", "<leader>f-", "<Cmd>Oil --float<CR>", { desc = "Open Parent Directory in Floating Window" })
	end,
}
