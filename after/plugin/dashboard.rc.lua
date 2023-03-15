local status, dashboard = pcall(require, "dashboard")
if not status then
	print("dashboard not found!")
	return
end

dashboard.setup({
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
				icon = " ",
				group = "@variable.builtin",
				action = "PackerUpdate",
				key = "u",
			},
			{
				icon = " ",
				desc = "Files",
				group = "@number",
				action = "Telescope find_files",
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
				desc = "dotfiles",
				group = "Constant",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
		footer = { "This too, shall pass" },
	},
})
