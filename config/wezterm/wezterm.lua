local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Leader is CTRL + s, like I set in my tmux config
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 500 }

-- Helper function to enter resize mode
-- performs ther first size adjustment then enters the resize mode key table
local resize_increment = 5
enter_resize_mode = function(direction)
  return act.Multiple {
    act.AdjustPaneSize { direction, resize_increment },
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
    { key = "H", action = act.AdjustPaneSize { "Left", resize_increment } },
    { key = "J", action = act.AdjustPaneSize { "Down",resize_increment } },
    { key = "K", action = act.AdjustPaneSize { "Up", resize_increment } },
    { key = "L", action = act.AdjustPaneSize { "Right", resize_increment } },
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
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },

  -- move panes
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection("Left") },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection("Down") },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection("Up") },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection("Right") },

  -- resize panes (allows repeating keypresses)
  { key = "H", mods = "LEADER", action = enter_resize_mode("Left")},
  { key = "J", mods = "LEADER", action = enter_resize_mode("Down")},
  { key = "K", mods = "LEADER", action = enter_resize_mode("Up")},
  { key = "L", mods = "LEADER", action = enter_resize_mode("Right")},

  -- rename tab
  { key = ",", mods = "LEADER", action = act.PromptInputLine {
    description = "Tab name: ",
    action = wezterm.action_callback(
      function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end
    ),
  }},

  -- navigate tabs
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "s", mods = "LEADER|CTRL", action = act.ActivateLastTab },

  -- create tab
  { key = "c", mods = "LEADER", action = act.SpawnTab "CurrentPaneDomain" },
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
config.tab_max_width = 20

-- Font
config.font = wezterm.font("MesloLGS NF")
config.font_size = 16

-- Disable audible bell
config.audible_bell = "Disabled"

-- When closing a tab, switch to the last active tab
config.switch_to_last_active_tab_when_closing_tab = true

return config
