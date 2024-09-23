return {
  "xiyaowong/transparent.nvim",
  opts = {
    groups = {
      "Normal",
      "NormalNC",
      "Comment",
      "Constant",
      "Special",
      "Identifier",
      "Statement",
      "PreProc",
      "Type",
      "Underlined",
      "Todo",
      "String",
      "Function",
      "Conditional",
      "Repeat",
      "Operator",
      "Structure",
      -- "LineNr",
      "NonText",
      "SignColumn",
      -- "CursorLine",
      -- "CursorLineNr",
      -- "StatusLine",
      -- "StatusLineNC",
      "EndOfBuffer",
    },

    extra_groups = {
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeWinSeparator",
    },

    -- add neotree
    exclude_groups = {
      "NormalFloat",
    },
    -- function: code to be executed after highlight groups are cleared
    -- Also the user event "TransparentClear" will be triggered
    on_clear = function() end,
  },
}
