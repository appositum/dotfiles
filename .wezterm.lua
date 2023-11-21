local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Mocha'
config.font_size = 12.3
config.font = wezterm.font('Mononoki Nerd Font Mono', {
  weight = 'Bold',
  italic = false,
})

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.colors = {
  ansi = {
    "#45475a",
    "#f38ba8",
    "#a6e3a1",
    "#f9e2af",
    "#89b4fa",
    "#cba6f7",
    "#94e2d5",
    "#bac2de",
  },
  brights = {
    "#585b70",
    "#f38ba8",
    "#a6e3a1",
    "#f9e2af",
    "#89b4fa",
    "#cba6f7",
    "#94e2d5",
    "#a6adc8",
  },

  tab_bar = {
    background = '#1e1e2e',

    active_tab = {
      bg_color = '#313244',
      fg_color = '#bac2de',
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1e1e2e',
      fg_color = '#bac2de',
    },

    inactive_tab_hover = {
      bg_color = '#bac2de',
      fg_color = '#1e1e2e',
      italic = false,
    },

    new_tab = {
      bg_color = '#7f849c',
      fg_color = '#1e1e2e',
    },

    new_tab_hover = {
      bg_color = '#7f849c',
      fg_color = '#bac2de',
      italic = false,
    },
  },
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.default_domain = 'WSL:Debian'

config.window_close_confirmation = 'NeverPrompt'

config.keys = {
  {
    key = 'w',
    mods = 'CTRL | SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
}

return config
