return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function()
			local todo_comments = require("todo-comments")
			todo_comments.setup({})
			vim.keymap.set("n", "]t", function()
				todo_comments.jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				todo_comments.jump_prev()
			end, { desc = "Previous todo comment" })
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

			require("Comment").setup({
				-- NORMAL mode mappings
				toggler = {
					line = "[c",
					block = "[b",
				},
				-- NORMAL and VISUAL mode mappings
				opleader = {
					line = "[c",
					block = "[b",
				},
				-- Extra mappings
				extra = {
					above = "gcO",
					below = "gco",
					eol = "gcA",
				},
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},
}
