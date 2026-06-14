vim.g.mapleader = " "
local keymap = vim.keymap

local custom = require("utils.custom")

keymap.set("n", "<leader>cl", custom.color_list, { desc = "List all color scheme" })

