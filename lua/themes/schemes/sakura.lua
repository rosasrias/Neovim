---@type Base46Table
local M = {}

M.base_30 = {
  white = "#D4E5E6",

  darker_black = "#090909",
  black = "#0F0F0F",
  black2 = "#151515",
  one_bg = "#191919",
  one_bg2 = "#232323",
  one_bg3 = "#2A2A2A",

  grey = "#3A3A3A",
  grey_fg = "#666666",
  grey_fg2 = "#7A7A7A",
  light_grey = "#9A9A9A",

  red = "#DD6777",
  baby_pink = "#D8AAB6",
  pink = "#C49EC4",

  line = "#2F2F2F",

  green = "#9EC49F",
  vibrant_green = "#A8D4A8",

  nord_blue = "#8AABAC",
  blue = "#8AABAC",
  seablue = "#9EC3C4",

  yellow = "#CEB188",
  sun = "#D8BE97",

  purple = "#C49EC4",
  dark_purple = "#A39EC4",

  teal = "#9EC3C4",
  orange = "#C49EA0",
  cyan = "#9EC3C4",

  statusline_bg = "#141414",
  lightbg = "#1F1F1F",

  pmenu_bg = "#C49EC4",
  folder_bg = "#8AABAC",
}

M.base_16 = {
  base00 = "#0F0F0F",
  base01 = "#191919",
  base02 = "#232323",
  base03 = "#2F2F2F",
  base04 = "#666666",
  base05 = "#D4E5E6",
  base06 = "#E7E7E7",
  base07 = "#E5E7E3",

  base08 = "#DD6777",
  base09 = "#C49EA0",
  base0A = "#CEB188",
  base0B = "#9EC49F",
  base0C = "#9EC3C4",
  base0D = "#8AABAC",
  base0E = "#C49EC4",
  base0F = "#A39EC4",
}

M.polish_hl = {}

M.theme_type = "dark"

M = require("themes").override_theme(M, "sakura")

return M
