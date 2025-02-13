return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- file system paths
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- snippet engine
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"saadparwaiz1/cmp_luasnip", -- for luasnip autocompletion
		"rafamadriz/friendly-snippets", -- use alongside LuaSnip
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		local hexToRGB = function(hex)
			-- Remove the '#' if it exists
			hex = hex:gsub("#", "")

			-- Extract the red, green, and blue components
			local r = tonumber(hex:sub(1, 2), 16)
			local g = tonumber(hex:sub(3, 4), 16)
			local b = tonumber(hex:sub(5, 6), 16)

			return r, g, b
		end

		local tailwindCSSFormatter = function(entry, vim_item)
			if
				vim_item.kind == "Color"
				and entry.completion_item.documentation
				and type(entry.completion_item.documentation) == "string"
			then
				local r, g, b = hexToRGB(entry.completion_item.documentation)
				if r then
					local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
					local group = "Tw_" .. color
					if vim.fn.hlID(group) < 1 then
						vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
					end
					vim_item.kind = "●"
					-- vim_item.kind = "⬤"
					vim_item.kind_hl_group = group
					return vim_item
				end
			end
			vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
			return vim_item
		end

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Allows me to scroll through documention when using autocomplete
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP completion
				{ name = "buffer" }, -- text withing current buffer
				{ name = "path" }, -- file system paths
				{ name = "luasnip" }, -- snippets
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					before = function(entry, vim_item)
						vim_item = tailwindCSSFormatter(entry, vim_item)
						return vim_item
					end,
				}),
			},
		})

		vim.keymap.set({ "i", "s" }, "<c-l>", function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<c-h>", function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { silent = true })
	end,
}
