local keymap = vim.keymap

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Remove highlight
keymap.set("n", "<leader>nh", ":noh<CR>")

-- Deletes text without replacing value in default register
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Deletes text in visual mode without replacing value in default register and pastes b/f cursor (Shift - P does the same thing as well)
keymap.set("x", "<leader>p", [["_dP]])

-- Yanks text to the system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Improved indenting
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- New tab
keymap.set("n", "te", ":tabedit")
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
-- Move window
keymap.set("n", ",", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<M-,>", "<C-w><")
keymap.set("n", "<M-.>", "<C-w>>")
keymap.set("n", "<M-b>", "<C-w>+")
keymap.set("n", "<M-s>", "<C-w>-")

-- Vertical Movements
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Move selected lines with shift+j or shift+k
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Open current file in a browser
keymap.set("n", "<leader>of", "<Cmd>lua vim.ui.open(vim.fn.expand('%'))<CR>")

-- Toggle to set scrolloff to essentially lock cursor to center of the screen or to set the scrolloff back to its original value
vim.keymap.set("n", "<leader>to", function()
	vim.opt.scrolloff = 999 - vim.o.scrolloff
end)

-- Join line while keeping the cursor in the same position
-- vim.keymap.set("n", "J", "mzJ`z")
