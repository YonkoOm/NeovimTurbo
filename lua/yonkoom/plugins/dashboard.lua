return {
	"nvimdev/dashboard-nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				project = {
					enable = true,
				},
				disable_move = true,
				shortcut = {
					{
						desc = "Update",
						icon = " ",
						group = "Include",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = " ",
						desc = "Files",
						group = "Function",
						action = "Telescope find_files find_command=rg,--ignore,--hidden,--files",
						key = "f",
					},
					{
						icon = " ",
						desc = "Apps",
						group = "String",
						action = "Telescope app",
						key = "a",
					},
					{
						icon = " ",
						desc = "config",
						group = "Constant",
						action = "Telescope config",
						key = "d",
					},
				},
				footer = { "", "🍥 dolce far niente 🍥" },
			},
		})
	end,
}
