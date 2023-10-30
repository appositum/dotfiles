---@type ChadrcConfig
local M = {}

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
  }
}

return M
