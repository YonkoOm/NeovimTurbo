return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
		local enable_format_on_save = function(_, bufnr)
			vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup_format,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end

		local augroup = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }) -- Centralize LSP Configurations around this group
		-- Use LspAttach autocommand to map the following keys after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = augroup,
			callback = function(ev)
				-- Mappings.
				local opts = { buffer = ev.buf, noremap = true, silent = true }

				-- See `:help vim.lsp.*` for documentation on any of the below functions
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				-- keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", "<Cmd>lsp restart<CR>", opts)
			end,
		})

		-- for enabling autocompletion (apply to every lsp server) -> tells the LSP "I know how to do a bunch of stuff that you might not have known I knew how to do" -> essentially a way to communicate between LSPs and nvim_lsp and allows us to receive more types of completion candidates. (https://github.com/hrsh7th/cmp-nvim-lsp)
		-- We override these capabilities sent to the server such that these completion candidates provided by nvim_lsp are provided by the server during a completion request
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		vim.lsp.config("jdtls", {
			on_attach = function(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
		})

		local severity = vim.diagnostic.severity

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
				spacing = 4,
			},
			underline = true,
			severity_sort = true,
			update_in_insert = false,
			float = {
				source = true, -- Or "if_many"
			},
			signs = {
				-- Diagnostic symbols in the sign column (gutter)
				text = {
					[severity.ERROR] = "",
					[severity.WARN] = "",
					[severity.HINT] = "󰌶",
					[severity.INFO] = "",
				},
			},
		})
	end,
}
