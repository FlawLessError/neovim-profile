local colors = {
  color_neutral_100 = "#faf6fd",
  color_neutral_400 = "#caa4eb",
  color_neutral_600 = "#852bcf",
  color_neutral_900 = "#571b8e",
  color_neutral_950 = "#220a38",

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
    c = { bg = colors.color_neutral_400 },
  },

  insert = {
    a = { fg = colors.color_neutral_900, bg = colors.yellow, gui = "bold" },
    c = { bg = colors.color_neutral_400 },
  },

  visual = {
    a = { fg = colors.color_neutral_900, bg = colors.lime, gui = "bold" },
    c = { bg = colors.color_neutral_400 },
  },

  command = {
    a = { fg = colors.color_neutral_900, bg = colors.lRed, gui = "bold" },
    c = { bg = colors.color_neutral_400 },
  },

  replace = {
    a = { fg = colors.color_neutral_900, bg = colors.purple, gui = "bold" },
    c = { bg = colors.color_neutral_400 },
  },

  terminal = {
    a = { fg = colors.color_neutral_900, bg = colors.lRed, gui = "bold" },
    c = { bg = colors.color_neutral_400 },
  },
  inactive = {
    a = { fg = colors.color_neutral_900, bg = colors.color_neutral_400 },
    b = { fg = colors.color_neutral_900, bg = colors.color_neutral_400 },
    c = { bg = colors.color_neutral_400 },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  event = "VeryLazy",
  opts = {
    options = {
      -- theme = celestial,
      theme = "tokyonight",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
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
          -- color = { fg = colors.color_neutral_100, bg = colors.color_neutral_600 },
        },
        { "filename", separator = { right = "" } },
        { "diagnostics", separator = { right = "" } },
        {
          "macro",
          fmt = function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
              return "Recording @" .. reg
            end
            return nil
          end,
          color = { fg = "#b554fe" },
          draw_empty = false,
        },
      },
      lualine_c = {
        "%=", -- the divider
      },
      lualine_x = {
        "%=", -- the divider
      },
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
          separator = { left = "" },
          -- color = { fg = colors.color_neutral_100, bg = colors.color_neutral_600 },
        },
        { "location", separator = { left = "" } },
      },
    },
    inactive_sections = {
      lualine_a = { { "filename", separator = { left = "", right = "" } } },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { { "location", separator = { left = "", right = "" } } },
    },
    tabline = {},
    extensions = {
      "neo-tree",
    },
  },
}
