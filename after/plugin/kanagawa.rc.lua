local colorscheme = "kanagawa"
local status, kanagawa = pcall(require, colorscheme)
if not status then
	print("Colorscheme " .. colorscheme .. " not found!")
end

kanagawa.setup({
	transparent = true,
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	overrides = function(colors)
		local theme = colors.theme
		local palette = colors.palette
		return {
			CursorLineNr = { fg = palette.carpYellow, bold = false },
			HoverBorder = { fg = palette.autumnYellow },

			-- Telescope
			TelescopeTitle = { fg = theme.ui.special, bold = true },
			TelescopePromptNormal = { bg = theme.ui.bg_p1 },
			TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
			TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
			TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
			TelescopePreviewNormal = { bg = theme.ui.bg_dim },
			TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

			-- Popup menu
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },

			-- theme colors will update dynamically when you change theme!
			SomePluginHl = { fg = colors.theme.syn.type, bold = true },
		}
	end,
})

kanagawa.load("wave")
