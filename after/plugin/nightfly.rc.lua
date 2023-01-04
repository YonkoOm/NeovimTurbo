--[[ local colorscheme = "nightfly"
local status, _ = pcall(require, colorscheme)
if not status then
	print("Colorscheme " .. colorscheme .. " not found!")
	return
end

vim.g.nightflyTransparent = true

vim.cmd("colorscheme " .. colorscheme) ]]
