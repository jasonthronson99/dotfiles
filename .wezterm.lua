local wezterm = require 'wezterm'
local config = wezterm.config_builder()
-- CONFIG STARTS HERE
config.enable_scroll_bar = true
config.keys = {
  { key = 'h', mods = 'ALT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'v', mods = 'ALT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'p', mods = 'ALT', action = wezterm.action.PaneSelect { mode = 'Activate' } },
}

-- CONFIG ENDS HERE
return config
