-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Do not check for or show window with update information
config.check_for_updates = false
config.show_update_window = false

-- Font
config.font = wezterm.font 'Fira Code'
config.font_size = 10.0

-- Color scheme
config.color_scheme = 'gruvbox_material_dark_hard'

-- Padding
config.window_padding = {
  left   = 20,
  right  = 20,
  top    = 20,
  bottom = 0,
}

-- Tab bar appearance
config.use_fancy_tab_bar            = false
config.enable_tab_bar               = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom            = true
config.tab_max_width                = 24

-- Colors
config.colors = {
  tab_bar = {
    background = '#1d2021',
    -- style tabs
    active_tab          = { bg_color = '#1d2021', fg_color = '#d4be98', intensity = 'Normal', italic = false, },
    inactive_tab        = { bg_color = '#1d2021', fg_color = '#7c6f64', intensity = 'Half',   italic = false, },
    inactive_tab_hover  = { bg_color = '#1d2021', fg_color = '#7c6f64', intensity = 'Half',   italic = false, },
    new_tab             = { bg_color = '#1d2021', fg_color = '#7c6f64', intensity = 'Half',   italic = false, },
    new_tab_hover       = { bg_color = '#1d2021', fg_color = '#7c6f64', intensity = 'Half',   italic = false, },
  }
}

-- Key Assignments
config.disable_default_key_bindings = true
config.keys = {}

for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = act.ActivateTab(i - 1),
  })
end

config.keys = {
  -- Tabs
  { key = 't', mods = 'ALT',      action = act.SpawnTab 'CurrentPaneDomain',        },
  { key = 'w', mods = "ALT|CTRL", action = act.CloseCurrentTab { confirm = false }, },

  -- Panes
  { key = 'v', mods = 'ALT', action = act.SplitVertical    { domain  = 'CurrentPaneDomain' }, },
  { key = 'h', mods = 'ALT', action = act.SplitHorizontal  { domain  = 'CurrentPaneDomain' }, },
  { key = 'x', mods = "ALT", action = act.CloseCurrentPane { confirm = false               }, },

  -- Navigation
  { key = 'LeftArrow',  mods = 'ALT', action = act.ActivateTabRelative(-1)       },
  { key = 'RightArrow', mods = 'ALT', action = act.ActivateTabRelative(1)        },
  { key = 'DownArrow',  mods = 'ALT', action = act.ActivatePaneDirection 'Next', },
  { key = 'UpArrow',    mods = 'ALT', action = act.ActivatePaneDirection 'Prev', },

  -- Copy Mode / Clipboard
  { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode,                         },
  { key = 'C', mods = 'CTRL', action = act.CopyTo    'ClipboardAndPrimarySelection', },
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard',                    },
}

return config

