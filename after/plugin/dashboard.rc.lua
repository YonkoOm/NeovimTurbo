local status, dashboard = pcall(require, "dashboard")
if not status then
	print("dashboard not found!")
	return
end

dashboard.custom_header = {
	"                                        ▟▙            ",
	"                                        ▝▘            ",
	"██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖",
	"██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██",
	"██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██",
	"██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██",
	"▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀",
	"",
}

--[[ dashboard.custom_center = {
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "Telescope file_browser",
		shortcut = "SPC f b",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	},
	{
		icon = "  ",
		desc = "Configure Neovim                         ",
		action = "edit ~/.config/nvim/after/plugin/dashboard.rc.lua",
		shortcut = "SPC v",
	},
} ]]
dashboard.custom_center = {
	{ icon = "  ", desc = "Find File                 ", action = "Telescope find_files" },
	{ icon = "  ", desc = "Recents                   ", action = "Telescope oldfiles" },
	{ icon = "  ", desc = "Find Word                 ", action = "Telescope live_grep" },
	{ icon = "洛 ", desc = "New File                  ", action = "DashboardNewFile" },
	{ icon = "  ", desc = "Bookmarks                 ", action = "Telescope marks" },
	{ icon = "⌨  ", desc = "Keymaps                   ", action = "Telescope keymaps" },
	{ icon = "  ", desc = "Load Last Session         ", action = "SessionLoad" },
}

dashboard.custom_footer = { "This too, shall pass :)" }
