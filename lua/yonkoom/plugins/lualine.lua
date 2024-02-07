return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons", { "rose-pine/neovim", name = "rose-pine" } },
	config = function()
		local lualine = require("lualine")
		local custom_theme = require("lualine.themes.rose-pine")

		custom_theme.insert.a.bg = "#7FB4CA"
		custom_theme.command.a.bg = "#D27E99"

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = custom_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
					"encoding",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
					},
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive" },
		})
	end,
}
