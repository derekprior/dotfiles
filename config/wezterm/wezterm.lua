local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Leader is CTRL + s, like I set in my tmux config
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 500 }

-- Helper function to enter resize mode
-- performs ther first size adjustment then enters the resize mode key table
enter_resize_mode = function(direction)
  return act.Multiple {
    act.AdjustPaneSize { direction, 1 },
    act.ActivateKeyTable {
      name = "resize_mode",
      one_shot = false,
      timeout_milliseconds = 500,
      until_unknown = true,
      replace_current = true,
    },
  }
end

-- Key table for resize mode (allows repeating keypresses to resize the pane)
config.key_tables = {
  resize_mode = {
    { key = "h", action = act.AdjustPaneSize { "Left", 1 } },
    { key = "j", action = act.AdjustPaneSize { "Down", 1 } },
    { key = "k", action = act.AdjustPaneSize { "Up", 1 } },
    { key = "l", action = act.AdjustPaneSize { "Right", 1 } },
  },
}

config.keys = {
  -- Splitting panes
  { mods = "LEADER", key = "-", action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { mods = "LEADER", key = "\\", action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },

  -- Zoom pane
  { mods = "LEADER", key = "z", action = act.TogglePaneZoomState },

  -- rotate panes
  { mods = "LEADER", key = "}", action = act.RotatePanes "Clockwise" },
  { mods = "LEADER", key = "{", action = act.RotatePanes "CounterClockwise" },

  -- activate copy mode or vim mode
  { key = 'Enter', mods = 'LEADER', action = act.ActivateCopyMode },

  -- resize panes (allows repeating keypresses)
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
    action = act.ActivateTab(i-1),
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
