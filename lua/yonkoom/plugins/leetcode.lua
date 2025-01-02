return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	lazy = "leetcode.nvim" ~= vim.fn.argv(0, -1),
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		lang = "python3",
		arg = "leetcode.nvim",
	},
}
