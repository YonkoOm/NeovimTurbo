--[[ local colorscheme = "catppuccin"
local status, catppuccin = pcall(require, colorscheme)
if not status then
	print("Colorscheme " .. colorscheme .. " not found!")
	return
end

catppuccin.setup({
	flavour = "frappe", -- Can be one of: latte, frappe, macchiato, mocha
	dim_inactive = {
		enabled = false,
		-- Dim inactive splits/windows/buffers.
		-- NOT recommended if you use old palette (a.k.a., mocha).
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = true,
	term_colors = true,
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	styles = {
		comments = { "italic" },
		properties = { "italic" },
		functions = { "italic", "bold" },
		keywords = { "italic" },
		operators = { "bold" },
		conditionals = { "bold" },
		loops = { "bold" },
		booleans = { "bold", "italic" },
		numbers = {},
		types = {},
		strings = {},
		variables = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		lsp_trouble = true,
		lsp_saga = true,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		nvimtree = true,
		which_key = true,
		indent_blankline = { enabled = true, colored_indent_levels = false },
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		markdown = true,
		lightspeed = false,
		ts_rainbow = true,
		mason = true,
		neotest = false,
		noice = false,
		hop = true,
		illuminate = true,
		cmp = true,
		dap = { enabled = true, enable_ui = true },
		notify = true,
		symbols_outline = false,
		coc_nvim = false,
		leap = false,
		neotree = { enabled = false, show_root = true, transparent_panel = false },
		telekasten = false,
		mini = false,
		aerial = false,
		vimwiki = true,
		beacon = false,
		navic = { enabled = false },
		overseer = false,
		fidget = true,
	},
	color_overrides = {
		mocha = {
			rosewater = "#F5E0DC",
			flamingo = "#F2CDCD",
			mauve = "#DDB6F2",
			pink = "#F5C2E7",
			red = "#F28FAD",
			maroon = "#E8A2AF",
			peach = "#F8BD96",
			yellow = "#FAE3B0",
			green = "#ABE9B3",
			blue = "#96CDFB",
			sky = "#89DCEB",
			teal = "#B5E8E0",
			lavender = "#C9CBFF",

			text = "#D9E0EE",
			subtext1 = "#BAC2DE",
			subtext0 = "#A6ADC8",
			overlay2 = "#C3BAC6",
			overlay1 = "#988BA2",
			overlay0 = "#6E6C7E",
			surface2 = "#6E6C7E",
			surface1 = "#575268",
			surface0 = "#302D41",

			base = "#1E1E2E",
			mantle = "#1A1826",
			crust = "#161320",
		},
	},
	highlight_overrides = {
		frappe = function(cp)
			return {
				-- For base configs.
				CursorLineNr = { fg = cp.lavender },
				LineNr = { fg = "#5eacd3" },
				Search = { style = { "bold" } },
				IncSearch = { bg = cp.pink, fg = cp.surface1 },

				-- For native lsp configs.
				DiagnosticVirtualTextError = { bg = cp.none },
				DiagnosticVirtualTextWarn = { fg = cp.peach, bg = cp.none },
				DiagnosticVirtualTextInfo = { bg = cp.none },
				DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

				DiagnosticHint = { fg = cp.rosewater },
				LspDiagnosticsDefaultHint = { fg = cp.rosewater },
				LspDiagnosticsHint = { fg = cp.rosewater },
				LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
				LspDiagnosticsUnderlineHint = { sp = cp.rosewater },
				-- For fidget.
				FidgetTask = { bg = cp.none, fg = cp.surface2 },
				FidgetTitle = { fg = cp.blue, style = { "bold" } },

				-- For treesitter.

				-- ["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
				-- ["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
				["@variable.builtin"] = { style = { "italic" } },

				-- ["@function"] = { fg = cp.blue },
				["@function.macro"] = { style = {} },

				-- ["@text.note"] = { fg = cp.base, bg = cp.blue },
				-- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
				-- ["@text.danger"] = { fg = cp.base, bg = cp.red },
				-- ["@constant.macro"] = { fg = cp.mauve },

				-- ["@label"] = { fg = cp.blue },
				["@method"] = { style = { "italic", "bold" } },

				-- ["@string"] = { fg = cp.green },
				-- ["@string.regex"] = { fg = cp.peach },
				-- ["@type"] = { fg = cp.yellow },
				["@tag.attribute"] = { style = { "italic" } },

				-- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
				-- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
				-- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
				-- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
				-- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
				-- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
				-- ["@string.escape"] = { fg = cp.pink },

				-- ["@property.toml"] = { fg = cp.blue },
				-- ["@field.yaml"] = { fg = cp.blue },

				-- ["@label.json"] = { fg = cp.blue },

				["@function.builtin.bash"] = { style = { "italic" } },
				["@parameter.bash"] = { style = { "italic" } },

				["@property.typescript"] = { style = { "italic" } },
				-- ["@constructor.typescript"] = { fg = cp.lavender },

				-- ["@constructor.tsx"] = { fg = cp.lavender },
				-- ["@tag.attribute.tsx"] = { fg = cp.mauve },

				["@property.css"] = { style = { "italic" } },

				-- ["@symbol"] = { fg = cp.flamingo },
			}
		end,
	},
})

vim.cmd("colorscheme " .. colorscheme) ]]
