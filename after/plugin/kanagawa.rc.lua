local colorscheme = "kanagawa"
local status, kanagawa = pcall(require, colorscheme)
if not status then
	print("Colorscheme " .. colorscheme .. " not found!")
end

kanagawa.setup({
	transparent = true,
})

vim.cmd("colorscheme " .. colorscheme)
