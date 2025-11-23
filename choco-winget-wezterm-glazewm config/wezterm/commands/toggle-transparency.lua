local wezterm = require("wezterm")
local constants = require("constants")

local commands = {

  brief = "Toggle terminal transparency",
  icon = "md_cricle_opacity",
  action = wezterm.action_callback(function(window)
    local overrides = window:get_config_overrides() or {}

    if not overrides.window_background_opacity or overrides.window_background_opacity == 1 then
      overrides.window_background_opacity = 0.7
      overrides.window_background_image = ""
    else
      overrides.window_background_opacity = 1
      overrides.window_background_image = constants.bg_image
    end

    window:set_config_overrides(overrides)
  end),
}

return commands
