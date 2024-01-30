local status, comment = pcall(require, "Comment")
if not status then
	return
end

comment.setup({
	toggler = {
		line = "[c",
		block = "gbc",
	},
	opleader = {
		line = "gc",
		block = "[c",
	},
	extra = {
		above = "gcO",
		below = "gco",
		eol = "gcA",
	},
})
