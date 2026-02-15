return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function()
    vim.g.codeium_disable_bindings = 1
    vim.g.codeium_enabled = false

    vim.keymap.set("i", "<c-x>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-e>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-q>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<c-l>", function()
      return vim.fn["codeium#AcceptNextWord"]()
    end, { expr = true, silent = true })
    vim.keymap.set("n", "<Space>ch", function()
      return vim.fn["codeium#Chat"]()
    end, { expr = true, silent = true, desc = "Codeium Chat" })
  end,
}
