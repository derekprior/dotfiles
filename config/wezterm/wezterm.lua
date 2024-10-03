local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Leader is CTRL + s, like I set in my tmux config
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 500 }

-- Helper function to enter resize mode
-- performs ther first size adjustment then enters the resize mode key table
local resize_increment = 5
local function enterResizeMode(direction)
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

local function isViProcess(pane)
  return pane:get_foreground_process_name():find('n?vim') ~= nil or pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
  if isViProcess(pane) then
    window:perform_action(
      act.SendKey({ key = vim_direction, mods = 'CTRL' }),
      pane
    )
  else
    window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
  end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
  conditionalActivatePane(window, pane, 'Right', 'l')
end)

wezterm.on('ActivatePaneDirection-left', function(window, pane)
  conditionalActivatePane(window, pane, 'Left', 'h')
end)

wezterm.on('ActivatePaneDirection-up', function(window, pane)
  conditionalActivatePane(window, pane, 'Up', 'k')
end)

wezterm.on('ActivatePaneDirection-down', function(window, pane)
  conditionalActivatePane(window, pane, 'Down', 'j')
end)

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
  { key = 'h', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-left') },
  { key = 'j', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-down') },
  { key = 'k', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-up') },
  { key = 'l', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-right') },

  -- resize panes (allows repeating keypresses)
  { key = "H", mods = "LEADER", action = enterResizeMode("Left")},
  { key = "J", mods = "LEADER", action = enterResizeMode("Down")},
  { key = "K", mods = "LEADER", action = enterResizeMode("Up")},
  { key = "L", mods = "LEADER", action = enterResizeMode("Right")},

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
