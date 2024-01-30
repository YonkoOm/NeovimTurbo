local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
	return
end

autotag.setup({
	filetypes = {
		"html",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"vue",
		"tsx",
		"jsx",
		"xml",
		"php",
		"markdown",
	},
	enable_close_on_slash = false,
})
