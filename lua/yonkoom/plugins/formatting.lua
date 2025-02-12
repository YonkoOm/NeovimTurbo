return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
				c = { "clang_format" },
				-- python = { "isort", "black" },
			},
			format_on_save = function(bufnr) -- conform automatically sets up the BufWritePre autocmd to format the file prior to writing/saving it
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return {
					lsp_format = "fallback",
					async = false,
					timeout_ms = 500,
				}
			end,
			-- notify_on_error = false,
		})

		vim.keymap.set({ "n", "v" }, "<leader>ff", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for the current buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})

		vim.keymap.set("n", "<leader>df", "<Cmd>FormatDisable<CR>")
		vim.keymap.set("n", "<leader>sf", "<Cmd>FormatEnable<CR>")
	end,
}
