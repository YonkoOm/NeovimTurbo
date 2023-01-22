local colorscheme = "kanagawa"
local status, kanagawa = pcall(require, colorscheme)
if not status then
	print("Colorscheme " .. colorscheme .. " not found!")
end

local colors = require("kanagawa.colors").setup()

kanagawa.setup({
	transparent = true,
	overrides = { HoverBorder = { fg = colors.autumnYellow } },
})

vim.cmd("colorscheme " .. colorscheme)
