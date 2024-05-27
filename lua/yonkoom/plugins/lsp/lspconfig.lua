return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_lspconfig = require("mason-lspconfig")

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
				vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				-- keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", "<Cmd>LspRestart<CR>", opts)
			end,
		})

		-- for enabling autocompletion (apply to every lsp server)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			-- Default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			-- Below are specific LSP's we don't run the default handler on due to specific configurations
			["jdtls"] = function()
				lspconfig.jdtls.setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						enable_format_on_save(client, bufnr)
					end,
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["clangd"] = function()
				lspconfig.clangd.setup({
					capabilities = capabilities,
					cmd = {
						"clangd",
						"--background-index",
						"--suggest-missing-includes",
						"--clang-tidy",
						"--header-insertion=iwyu",
					},
					filetypes = {
						"c",
					},
				})
			end,
		})

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, prefix = "●" },
			severity_sort = true,
		})

		-- Diagnostic symbols in the sign column (gutter)
		local signs = { Error = "", Warn = " ", Hint = "󰌶", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
			},
			update_in_insert = true,
			float = {
				source = "always", -- Or "if_many"
			},
		})
	end,
}
