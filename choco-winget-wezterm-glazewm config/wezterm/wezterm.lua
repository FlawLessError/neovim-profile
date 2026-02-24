local wezterm = require("wezterm")
local constants = require("constants")
local commands = require("commands")
local config = wezterm.config_builder()

-- Font settings
config.font_size = 15
config.line_height = 1
config.font = wezterm.font("DepartureMono Nerd Font")

-- Colors
config.colors = {
  cursor_bg = "#7E56C2",
  cursor_border = "#ffffff",
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_image = constants.bg_image
config.win32_system_backdrop = "Acrylic"
config.window_padding = {
  top = 0,
  left = 0,
  right = 0,
  bottom = 0,
}

-- Miscellaneous settings
config.max_fps = 60 -- was 120
config.prefer_egl = true
config.default_prog = { "pwsh.exe" }

-- Custom commands
wezterm.on("augment-command-palette", function()
  return commands
end)

local tabFontColorActive = "#d80982"
local tabFontColorInActive = "#b00669"
local titleBarColor = "#0b0022"

config.window_frame = {
  font = wezterm.font({ family = "DepartureMono Nerd Font" }),
  font_size = 12.0,
  active_titlebar_bg = titleBarColor,
}

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = "#150046",
      fg_color = tabFontColorActive,
    },

    inactive_tab_edge = "None",

    inactive_tab = {
      bg_color = "None",
      fg_color = tabFontColorInActive,
    },

    inactive_tab_hover = {
      bg_color = "None",
      fg_color = tabFontColorInActive,
    },

    new_tab = {
      bg_color = "None",
      fg_color = titleBarColor,
    },
    new_tab_hover = {
      bg_color = "None",
      fg_color = "None",
    },
  },
}

return config
