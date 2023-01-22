local status, zenMode = pcall(require, "zen-mode")
if not status then
	return
end

zenMode.setup({
	window = {
		width = 90,
	},
})

vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<cr>", { silent = true })
