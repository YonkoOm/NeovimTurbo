return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file)
		vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
		vim.keymap.set("n", "<C-h>", ui.nav_prev)
		vim.keymap.set("n", "<C-l>", ui.nav_next)

		for i = 1, 5 do
			vim.keymap.set("n", string.format("<C-%s>", i), function()
				ui.nav_file(i)
			end)
		end
	end,
}
