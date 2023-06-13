local colorscheme = "rose-pine"
local status, rose_pine = pcall(require, colorscheme)
if not status then
	print("Colorscheme " .. colorscheme .. " not found")
	return
end

rose_pine.setup({
	dark_variant = "main",
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,

	highlight_groups = {
		CursorLineNr = { fg = "#7dd3fc" },
		--[[ ["@function"] = { fg = "rose" },
		["@variable"] = { fg = "#7dd3fc" }, ]]
	},
})

vim.cmd("colorscheme " .. colorscheme)
