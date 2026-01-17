-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

local function openTab()
	vim.cmd("tabnew")
	vim.cmd("Neotree toggle filesystem left reveal")
end

keymap.set("n", "<leader>hl", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Split management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader>sq", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Resize splits
keymap.set("n", "<leader>sj", "<C-w>-", { desc = "Shorten height" })
keymap.set("n", "<leader>sk", "<C-w>+", { desc = "Increase height" })
keymap.set("n", "<leader>sl", "<C-w>>5", { desc = "Widen split" })
keymap.set("n", "<leader>sh", "<C-w><5", { desc = "Narrow split" })

-- Navigate between splits
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })

-- Swap windows
keymap.set("n", "<leader>rw", "<C-w>x", { desc = "Swap with next window" })

-- Tab management
keymap.set("n", "<leader>to", openTab, { desc = "open a new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close a tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = " previous tab" })
