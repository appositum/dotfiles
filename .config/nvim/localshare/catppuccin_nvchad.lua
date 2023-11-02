-- ~/.local/share/nvim/lazy/base46/lua/base46/themes/catppuccin.lua
-- changed some colors

local M = {}

M.base_30 = {
  white = "#bac2de", -- "#D9E0EE",
  darker_black = "#181825", -- "#191828"
  black = "#1e1e2e", -- "#1E1D2D" --  nvim bg
  black2 = "#252434",
  one_bg = "#2d2c3c", -- real bg of onedark
  one_bg2 = "#363545",
  one_bg3 = "#3e3d4d",
  grey = "#45475a", -- "#474656"
  grey_fg = "#585b70", -- "#4e4d5d",
  grey_fg2 = "#6c7086", -- "#585b70", -- "#555464"
  light_grey = "#7f849c", -- "#6c7086", -- "#605f6f"
  red = "#F38BA8",
  baby_pink = "#ffa5c3",
  pink = "#F5C2E7",
  line = "#313244", -- "#383747", -- for lines like vertsplit
  green = "#a6e3a1", -- "#ABE9B3"
  vibrant_green = "#b6f4be",
  nord_blue = "#8bc2f0",
  blue = "#89B4FA",
  yellow = "#f9e2af", -- "#FAE3B0"
  sun = "#ffe9b6",
  purple = "#cba6f7", -- "#d0a9e5"
  dark_purple = "#c7a0dc",
  teal = "#94e2d5", -- "#B5E8E0"
  orange = "#fab387", -- "F8BD96"
  cyan = "#89DCEB",
  statusline_bg = "#1e1e2e", -- "#232232",
  lightbg = "#313244", -- "#2f2e3e",
  pmenu_bg = "#a6e3a1",
  folder_bg = "#89B4FA",
  lavender = "#b4befe", -- "#c7d1ff"
}

M.base_16 = {
  base00 = "#1e1e2e",
  base01 = "#282737",
  base02 = "#2f2e3e",
  base03 = "#383747",
  base04 = "#414050",
  base05 = "#bfc6d4",
  base06 = "#ccd3e1",
  base07 = "#D9E0EE",
  base08 = "#F38BA8",
  base09 = "#fab387",
  base0A = "#f9e2af",
  base0B = "#a6e3a1",
  base0C = "#89DCEB",
  base0D = "#89B4FA",
  base0E = "#CBA6F7",
  base0F = "#F38BA8",
}

M.polish_hl = {
  ["@variable"] = { fg = M.base_30.lavender },
  ["@property"] = { fg = M.base_30.teal },
  ["@variable.builtin"] = { fg = M.base_30.red },
}

M.type = "dark"

M = require("base46").override_theme(M, "catppuccin")

return M
