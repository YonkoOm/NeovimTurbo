local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end
local color_status, kanagawa = pcall(require, "kanagawa.colors")
if not color_status then
	return
end
local colors = kanagawa.setup({ theme = "wave" }).palette

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "padded_slant",
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
	},
	highlights = {
		separator = {
			fg = colors.crystalBlue,
			bg = colors.sumiInk0,
		},
		separator_selected = {
			fg = colors.crystalBlue,
		},
		background = {
			fg = "#657b83",
			bg = colors.sumiInk0,
		},
		buffer_selected = {
			fg = "#fdf6e3",
			bold = true,
			italic = false,
		},
		fill = {
			bg = colors.sumiInk0,
		},
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
