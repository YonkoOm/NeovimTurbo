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
			-- update kanagawa to handle new treesitter highlight captures
			["@string.regexp"] = { link = "@string.regex" },
			["@variable.parameter"] = { link = "@parameter" },
			["@exception"] = { link = "@exception" },
			["@string.special.symbol"] = { link = "@symbol" },
			["@markup.strong"] = { link = "@text.strong" },
			["@markup.italic"] = { link = "@text.emphasis" },
			["@markup.heading"] = { link = "@text.title" },
			["@markup.raw"] = { link = "@text.literal" },
			["@markup.quote"] = { link = "@text.quote" },
			["@markup.math"] = { link = "@text.math" },
			["@markup.environment"] = { link = "@text.environment" },
			["@markup.environment.name"] = { link = "@text.environment.name" },
			["@markup.link.url"] = { link = "Special" },
			["@markup.link.label"] = { link = "Identifier" },
			["@comment.note"] = { link = "@text.note" },
			["@comment.warning"] = { link = "@text.warning" },
			["@comment.danger"] = { link = "@text.danger" },
			["@diff.plus"] = { link = "@text.diff.add" },
			["@diff.minus"] = { link = "@text.diff.delete" },

			CursorLineNr = { fg = palette.lightBlue, bold = false },
			HoverBorder = { fg = palette.crystalBlue },

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
		}
	end,
})

vim.cmd("colorscheme kanagawa-wave")
