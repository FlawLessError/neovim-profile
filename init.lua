-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Associate .ejs files with HTML filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ejs",
  callback = function()
    vim.bo.filetype = "html" -- or 'javascript', depending on your preference
  end,
})
