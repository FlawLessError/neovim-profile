-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd("set scrolloff=8")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- for folding a block of code
-- vim.cmd("set foldmethod=indent")

local function enforceColors()
  -- Set colors for LineNr
  -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#C40879", bg = "White", bold = true })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#2B8FF3", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#B50603", bold = true })

  -- Set CursorLineNr with white background
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9a0e", bg = "#c14000", bold = true })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#290e00" })

  vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#100500" })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "#ff9a0e" })
  -- vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { bg = "#a780ff" })
  vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "#100500" })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", { bg = "#100500" })
end

-- Call the function to apply the settings
enforceColors()

-- Optionally, use an autocommand to reapply these colors when the colorscheme is changed
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = enforceColors,
})
