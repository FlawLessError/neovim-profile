-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- enables true colors
vim.opt.termguicolors = true

-- number of extra lines/columns to keep between cursor and edge of screen
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- disable additional junk files
-- https://gitlab.com/jokeyrhyme/dotfiles/-/blob/main/config/nvim/init.lua#L5-11
vim.o.swapfile = false

-- tab stuff
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 8

-- for folding a block of code
-- vim.cmd("set foldmethod=indent")

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
-- https://gitlab.com/jokeyrhyme/dotfiles/-/blob/main/config/nvim/init.lua#L5-11
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

local function enforceColors()
  -- Set colors for LineNr
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#C40879", bg = "White", bold = true })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#2B8FF3", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#B50603", bold = true })

  -- Set CursorLine and CursorLineNr colors
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ad5fff", bg = "#4f009e", bold = true })
  -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#f4eafe" })
  -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#ad5fff" })

  -- Set TreesitterContext colors
  -- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#100500" })
  -- vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "#ff9a0e" })
  -- vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "#100500" })
  -- vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", { bg = "#100500" })

  -- set which-key colors
  -- vim.api.nvim_set_hl(0, "WhichKey", { bg = "#100500" })
  -- vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "#ff9a0e" })
  -- vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "#100500" })
  -- vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#ff9a0e" })
  -- vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#ffffff" })
  -- vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = "#ff9a0e" })
  -- vim.api.nvim_set_hl(0, "WhichKey", { fg = "#ffffff" })
  -- vim.api.nvim_set_hl(0, "WhichKeyIconBlue", { fg = "#ff9a0e" })

  -- Set GitSigns colors
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#95CB2A" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#5B4BE7" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#C30505" })

  -- Set NeoTree Git Signs
  vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#95CB2A" })
  vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = "#c7c700" })
  vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#C30505" })
  vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#c5c0f6" })
  vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#5B4BE7" })
  vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#4ae78e" })
end

-- Call the function to apply the settings
enforceColors()

-- Optionally, use an autocommand to reapply these colors when the colorscheme is changed
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = enforceColors,
})
