local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local wez_action = wezterm.action

-- Leader is CTRL + s, like tmux
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 500 }

resize_opts = {
  name = "resize_mode",
  one_shot = false,
  timeout_milliseconds = 1000,
  until_unknown = true,
  replace_current = true,
}

enter_resize_mode = function(direction)
  return wez_action.Multiple {
    wez_action.AdjustPaneSize { direction, 1 },
    wez_action.ActivateKeyTable {
      name = "resize_mode",
      one_shot = false,
      timeout_milliseconds = 500,
      until_unknown = true,
      replace_current = true,
    },
  }
end

config.key_tables = {
  resize_mode = {
    { key = "h", action = wez_action.AdjustPaneSize { "Left", 1 } },
    { key = "j", action = wez_action.AdjustPaneSize { "Down", 1 } },
    { key = "k", action = wez_action.AdjustPaneSize { "Up", 1 } },
    { key = "l", action = wez_action.AdjustPaneSize { "Right", 1 } },
  },
}

config.keys = {
  -- Splitting panes
  {
    mods   = "LEADER",
    key    = "-",
    action = wez_action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods   = "LEADER",
    key    = "\\",
    action = wez_action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Zoom pane
  {
    mods   = "LEADER",
    key    = "z",
    action = wez_action.TogglePaneZoomState,
  },
  -- rotate panes
  {
    mods = "LEADER",
    key = "}",
    action = wez_action.RotatePanes "Clockwise",
  },
  {
    mods = "LEADER",
    key = "{",
    action = wez_action.RotatePanes "CounterClockwise",
  },
  -- activate copy mode or vim mode
  {
    key = 'Enter',
    mods = 'LEADER',
    action = wez_action.ActivateCopyMode
  },
  -- resize panes
  { key = "h", mods = "LEADER", action = enter_resize_mode("Left")},
  { key = "j", mods = "LEADER", action = enter_resize_mode("Down")},
  { key = "k", mods = "LEADER", action = enter_resize_mode("Up")},
  { key = "l", mods = "LEADER", action = enter_resize_mode("Right")},
}

-- Tab switching by number
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wez_action.ActivateTab(i-1),
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
