---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"

M.ui = {
  theme = "catppuccin",
  statusline = {
    theme = "default",
    separator_style = "default",
  },
  hl_override = {
    CursorLine = {
      bg = "lightbg",
    },
    CursorLineNr = {
      bg = "grey",
      fg = "purple",
    }
  },
  tabufline = {
    enabled = false,
  },
  nvdash = {
    enabled = false,
  }
}

return M
