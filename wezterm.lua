-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- or, changing the font size and color scheme.
config.font_size = 10

config.default_prog = { 'nu' }

-- Colors
config.colors = {
  background = '#100020',
  tab_bar = {
    active_tab = {
      bg_color = '#100020',
      fg_color = '#c0c0c0',
    }
  },
}

config.hide_tab_bar_if_only_one_tab = true

-- Keybindings
config.keys = {
  -- Rebind ToggleFullScreen to CTRL+ALT+Enter
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'Enter',
    mods = 'CTRL|ALT',
    action = wezterm.action.ToggleFullScreen,
  },
}

config.enable_wayland=false

-- Finally, return the configuration to wezterm:
return config
