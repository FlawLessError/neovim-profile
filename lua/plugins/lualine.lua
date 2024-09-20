local colors = {
  yellow = "#FCD32F",
  lime = "#95CB2A",
  black = "#140A01",
  dBrown = "#534B3C",
  purple = "#5B4BE7",
  lOrange = "#FFFF7E",
  orange = "#FF9D19",
  dOrange = "#B45604",
  lBrown = "#BAB1A0",
  red = "#C30505",
  lRed = "#E31F1F",
}

local celestial = {
  normal = {
    a = { fg = colors.black, bg = colors.orange, gui = "bold" },
    b = { fg = colors.orange, bg = colors.black },
    c = { fg = colors.dBrown },
  },

  insert = {
    a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
  },

  visual = {
    a = { fg = colors.black, bg = colors.lime, gui = "bold" },
  },

  command = {
    a = { fg = colors.black, bg = colors.lRed, gui = "bold" },
  },

  replace = {
    a = { fg = colors.black, bg = colors.purple, gui = "bold" },
  },

  inactive = {
    a = { fg = colors.orange, bg = colors.black },
    b = { fg = colors.orange, bg = colors.black },
    c = { fg = colors.orange },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = celestial,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          separator = { left = "" },
          fmt = function(str)
            local mode_map = {
              ["n"] = " NOR",
              ["i"] = " INS",
              ["v"] = " VIS",
              ["V"] = " V-L",
              ["c"] = " CMD",
              ["R"] = " REP",
            }
            local mode = vim.fn.mode()
            return mode_map[mode] or str
          end,
        },
      },
      lualine_b = {
        {
          "branch",
          icons_enabled = true,
          icon = { "", align = "left" },
          separator = { left = "", right = "" },
          color = { fg = colors.lOrange, bg = colors.dOrange },
        },
        { "filename", separator = { left = "", right = "" } },
        { "diagnostics", separator = { right = "" } },
      },
      lualine_c = {
        "%=", -- the divider
      },
      lualine_x = {},
      lualine_y = {
        {
          "diff",
          symbols = { added = " ", modified = " ", removed = " " },
          diff_color = {
            added = { fg = colors.lime },
            modified = { fg = colors.purple },
            removed = { fg = colors.red },
          },
        },
        "encoding",
        { "filetype" },
      },
      lualine_z = {
        { "progress", separator = { left = "" }, color = { fg = colors.lOrange, bg = colors.dOrange } },
        { "location", separator = { left = "", right = "" } },
      },
    },
    inactive_sections = {
      lualine_a = { { "filename", separator = { left = "", right = "" } } },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { { "location", separator = { left = "", right = "" } } },
    },
    tabline = {},
    extensions = {
      "neo-tree",
    },
  },
}
