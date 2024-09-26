-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Define key mappings directly
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- toggleTerm keybindings
vim.api.nvim_set_keymap("n", "<c-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR>', opts)

-- LSP remapping
return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = { "<c-y>", "cmp.mapping.complete()" }
  end,
}
