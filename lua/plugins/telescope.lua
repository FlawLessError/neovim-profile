return {
  "nvim-telescope/telescope.nvim",
  require("telescope").setup({
    defaults = {
      file_ignore_patterns = {
        "node_modules",
      },
    },
  }),
}
