local Plugin = {'nvim-lualine/lualine.nvim'}

Plugin.name = 'lualine'

Plugin.event = 'VeryLazy'

local mode_map = {
  ['NORMAL'] = 'N',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = 'I',
  ['VISUAL'] = 'V',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = '!',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

-- See :help lualine.txt
Plugin.opts = {
  options = {
    theme = 'catppuccin_mocha',
    icons_enabled = true,
    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {{'mode', fmt = function(s) return mode_map[s] or s end}},
    lualine_b = {{
      'filetype',
      icon_only = true,
      colored = false,
      separator = '',
      padding = {
        right = 0,
        left = 1
      }
    }, 'filename', 'diagnostics'},
    lualine_c = {'branch', 'diff'},
    lualine_x = {'searchcount'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

function Plugin.init()
  vim.opt.showmode = false
end

return Plugin
