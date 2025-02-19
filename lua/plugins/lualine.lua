local colors = {
  color_neutral_100 = "#faf6fd",
  color_neutral_400 = "#9242d6",
  color_neutral_600 = "#46176d",
  color_neutral_900 = "#10051a",

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
    a = { fg = colors.color_neutral_900, bg = colors.color_neutral_400, gui = "bold" },
    b = { fg = colors.color_neutral_400, bg = colors.color_neutral_900 },
    c = { fg = colors.color_neutral_600 },
  },

  insert = {
    a = { fg = colors.color_neutral_900, bg = colors.yellow, gui = "bold" },
  },

  visual = {
    a = { fg = colors.color_neutral_900, bg = colors.lime, gui = "bold" },
  },

  command = {
    a = { fg = colors.color_neutral_900, bg = colors.lRed, gui = "bold" },
  },

  replace = {
    a = { fg = colors.color_neutral_900, bg = colors.purple, gui = "bold" },
  },

  terminal = {
    a = { fg = colors.color_neutral_900, bg = colors.lRed, gui = "bold" },
  },
  inactive = {
    a = { fg = colors.color_neutral_900, bg = colors.color_neutral_400 },
    b = { fg = colors.color_neutral_900, bg = colors.color_neutral_400 },
    c = { fg = colors.color_neutral_900 },
  },
}

local function macro_recording()
  local mode = require("noice").api.statusline.mode.get()
  if mode then
    return string.match(mode, "^recording @.*") or ""
  end
  return ""
end

return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  event = "VeryLazy",
  opts = {
    options = {
      theme = celestial,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = " " },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          separator = { right = "" },
          fmt = function(str)
            local mode_map = {
              ["n"] = "NOR",
              ["i"] = "INS",
              ["v"] = "VIS",
              ["V"] = "V-L",
              ["c"] = "CMD",
              ["t"] = "TRM",
              ["R"] = "REP",
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
          color = { fg = colors.color_neutral_100, bg = colors.color_neutral_600 },
        },
        { "filename", separator = { right = "" } },
        { "diagnostics", separator = { right = "" } },
        macro_recording,
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
        {
          "progress",
          separator = { left = " " },
          color = { fg = colors.color_neutral_100, bg = colors.color_neutral_600 },
        },
        { "location", separator = { left = " " } },
      },
    },
    inactive_sections = {
      lualine_a = { { "filename", separator = { left = " ", right = " " } } },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { { "location", separator = { left = " ", right = " " } } },
    },
    tabline = {},
    extensions = {
      "neo-tree",
    },
  },
}
