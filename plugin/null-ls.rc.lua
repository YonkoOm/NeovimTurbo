local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup({
	sources = {
		-- formatting
		null_ls.builtins.formatting.black.with({ extra_arg = { "--fast" } }),
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.deno_fmt.with({
			filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
		}),
		-- null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustfmt,
		-- diagnostics
		null_ls.builtins.diagnostics.eslint_d.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),
		null_ls.builtins.diagnostics.fish,
		-- spell checker
		null_ls.builtins.diagnostics.cspell.with({
			filetypes = { "markdown" },
		}),
		null_ls.builtins.code_actions.cspell.with({
			filetypes = { "markdown" },
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
