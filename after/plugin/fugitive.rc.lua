local keymap = vim.keymap
keymap.set("n", "<leader>gs", vim.cmd.Git)
keymap.set("n", "<leader>gd", ":Git diff<CR>")
keymap.set("n", "<leader>gb", ":Git blame<CR>")
keymap.set("n", "<leader>ga", ":Git add")
