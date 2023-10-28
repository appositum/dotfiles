local Plugin = {'nvim-lualine/lualine.nvim'}

Plugin.name = 'lualine'

Plugin.event = 'VeryLazy'

-- See :help lualine.txt
Plugin.opts = {
  options = {
    theme = 'catppuccin',
    icons_enabled = true,
    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
}

function Plugin.init()
  vim.opt.showmode = false
end

return Plugin
