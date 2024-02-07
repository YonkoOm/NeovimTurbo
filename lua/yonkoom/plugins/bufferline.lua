return {
	"akinsho/bufferline.nvim",
	dependencies = { "rebelot/kanagawa.nvim" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		local colors = require("kanagawa.colors").setup({ theme = "wave" })
		local palette_colors = colors.palette

		bufferline.setup({
			options = {
				mode = "tabs",
				separator_style = "slant",
				always_show_bufferline = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
			},
			highlights = {
				separator = {
					fg = palette_colors.crystalBlue,
					bg = palette_colors.sumiInk0,
				},
				separator_selected = {
					fg = palette_colors.crystalBlue,
				},
				background = {
					fg = "#657b83",
					bg = palette_colors.sumiInk0,
				},
				buffer_selected = {
					fg = "#fdf6e3",
					bold = true,
					italic = false,
				},
				fill = {
					bg = palette_colors.sumiInk0,
				},
			},
		})

		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
	end,
}
