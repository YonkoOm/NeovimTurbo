return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local status, telescope = pcall(require, "telescope")
		if not status then
			return
		end
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		local function telescope_buffer_dir()
			return vim.fn.expand("%:p:h")
		end

		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			-- pickers = {
			-- 	find_files = {
			-- 		theme = "ivy",
			-- 	},
			-- },
			extensions = {
				fzf = {},
				file_browser = {
					theme = "dropdown",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["l"] = actions.select_default,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			},
		})

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "file_browser")

		vim.keymap.set("n", "sf", function()
			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = true,
				initial_mode = "normal",
				layout_config = { height = 40, width = 100 },
			})
		end)

		vim.keymap.set("n", ";f", function()
			builtin.find_files({
				no_ignore = false,
				hidden = false,
			})
		end)

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end)

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find({
				windblend = 1,
				previewer = false,
				layout_config = { height = 40, width = 100 },
			})
		end)

		-- search every file that is installed by lazy
		vim.keymap.set("n", "<leader>lz", function()
			builtin.find_files({
				cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
			})
		end)

		vim.keymap.set("n", ";r", builtin.live_grep)
		vim.keymap.set("n", "\\\\", builtin.buffers)
		vim.keymap.set("n", ";t", builtin.help_tags)
		vim.keymap.set("n", ";;", builtin.resume)
		vim.keymap.set("n", ";e", builtin.diagnostics)
		vim.keymap.set("n", ";o", builtin.oldfiles)
		vim.keymap.set("n", ";c", builtin.grep_string)
	end,
}
