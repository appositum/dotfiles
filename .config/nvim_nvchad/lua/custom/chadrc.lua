---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

M.ui = {
  theme = "catppuccin",
  statusline = {
    overriden_modules = function (modules)
      modules[10] = "%#SepHl#" .. ""
        .. "%#IconHl#" .. ""
        .. "%#SepHl#" .. "█"
        .. "%#TextHl#" .. " %l:%c "
    end
  },
  hl_add = {
    SepHl = {
      fg = "yellow",
      bg = "lightbg",
    },
    IconHl = {
      fg = "lightbg",
      bg = "yellow",
    },
    TextHl = {
      fg = "yellow",
      bg = "lightbg",
    },
    RainbowDelimiterRed = {
      fg = "red"
    },
    RainbowDelimiterYellow = {
      fg = "yellow"
    },
    RainbowDelimiterBlue = {
      fg = "blue"
    },
    RainbowDelimiterOrange = {
      fg = "orange"
    },
    RainbowDelimiterGreen = {
      fg = "green"
    },
    RainbowDelimiterViolet = {
      fg = "purple"
    },
    RainbowDelimiterCyan = {
      fg = "cyan"
    },
  },
  hl_override = {
    CursorLineNr = {
      bg = "grey",
      fg = "purple",
    }
  },
  tabufline = {
    enabled = true,
  },
  nvdash = {
    enabled = false,
  },
  cmp = {
    style = "atom_colored"
  }
}

return M
