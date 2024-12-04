-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Define key mappings directly
local opts = { noremap = true, silent = true }

-- Moving text
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- activate Minty
vim.keymap.set("n", "<c-z>", function()
  require("minty.huefy").open()
end, opts)

-- This one for opening a path on another window;
vim.keymap.set("n", "gw", "<c-w>o<c-w>vgf", { noremap = true, silent = true, desc = "open path on another window" })
