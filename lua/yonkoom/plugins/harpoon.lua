return {
	"theprimeagen/harpoon",
	config = function()
		local harpoon = require("harpoon")
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file)
		vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
		vim.keymap.set("n", "<C-h>", ui.nav_prev)
		vim.keymap.set("n", "<C-l>", ui.nav_next)

		vim.keymap.set("n", "'a", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "'s", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "'d", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "'f", function()
			ui.nav_file(4)
		end)

		-- for i = 1, 5 do
		-- 	vim.keymap.set("n", string.format("<leader>%s", i), function()
		-- 		ui.nav_file(i)
		-- 	end)
		-- end
	end,
}
