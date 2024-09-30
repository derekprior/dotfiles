local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  -- Splitting panes
  {
    mods   = "LEADER",
    key    = "-",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods   = "LEADER",
    key    = "\\",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Zoom pane
  {
    mods   = "LEADER",
    key    = "z",
    action = wezterm.action.TogglePaneZoomState,
  },
  -- rotate panes
  {
    mods = "LEADER",
    key = "}",
    action = wezterm.action.RotatePanes "Clockwise",
  },
  {
    mods = "LEADER",
    key = "{",
    action = wezterm.action.RotatePanes "CounterClockwise",
  },
  -- activate copy mode or vim mode
  {
    key = 'Enter',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode
  }
}

-- Tab switching by number
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i-1),
  })
end

-- Theme
config.color_scheme = "Dracula (Official)"
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

-- Font
config.font = wezterm.font("MesloLGS NF")
config.font_size = 16

-- Disable audible bell
config.audible_bell = "Disabled"

return config
