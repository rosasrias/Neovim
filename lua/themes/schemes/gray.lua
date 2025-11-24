-- gray theme
-- by karmx

local M = {}

-- =========================================
-- Base 30 (UI colors)
-- =========================================
M.base_30 = {
  white = "#d8d8d8",
  black = "#131519", -- background
  darker_black = "#0e1013", -- ~6% darker
  black2 = "#1a1d22", -- ~6% lighter
  one_bg = "#1f2227", -- +10%
  one_bg2 = "#25292f", -- +6%
  one_bg3 = "#2b2f36", -- +6%
  grey = "#3b3f46", -- neutral grey (~40% lighter)
  grey_fg = "#454950",
  grey_fg2 = "#50545b",
  light_grey = "#5b5f67",

  red = "#BF616A",
  baby_pink = "#d67b84",
  pink = "#B48EAD",
  line = "#1d2025", -- separator lines (~15% lighter than bg)
  green = "#A3BE8C",
  vibrant_green = "#b2ce9a",
  nord_blue = "#81A1C1",
  blue = "#81A1C1",
  seablue = "#88C0D0",
  yellow = "#EBCB8B",
  sun = "#f0d598",
  purple = "#B48EAD",
  dark_purple = "#a67da0",
  teal = "#8FBCBB",
  orange = "#d08770",
  cyan = "#88C0D0",

  statusline_bg = "#17191e",
  lightbg = "#202328",
  pmenu_bg = "#81A1C1",
  folder_bg = "#81A1C1",
}

-- =========================================
-- Base 16 (for LSP / syntax highlight)
-- Reference: https://github.com/chriskempson/base16
-- =========================================
M.base_16 = {
  base00 = "#131519", -- background
  base01 = "#1a1d22", -- slightly lighter
  base02 = "#25292f", -- selection / subtle highlights
  base03 = "#3b3f46", -- comments
  base04 = "#5b5f67", -- muted text
  base05 = "#d8d8d8", -- foreground
  base06 = "#e5e9f0", -- light fg
  base07 = "#ECEFF4", -- white
  base08 = "#BF616A", -- red
  base09 = "#d08770", -- orange
  base0A = "#EBCB8B", -- yellow
  base0B = "#A3BE8C", -- green
  base0C = "#88C0D0", -- cyan
  base0D = "#81A1C1", -- blue
  base0E = "#B48EAD", -- purple
  base0F = "#8FBCBB", -- teal / alt
}

-- =========================================
-- Polish Highlights (optional)
-- =========================================
M.polish_hl = {
  defaults = {
    Comment = {
      fg = "#4C566A",
      italic = true,
    },
  },

  treesitter = {
    ["@variable"] = { fg = "#d8d8d8" },
    ["@function"] = { fg = "#81A1C1", bold = true },
    ["@keyword"] = { fg = "#B48EAD", italic = true },
  },
}

-- =========================================
-- Theme metadata
-- =========================================
M.theme_type = "dark"

M = require("themes").override_theme(M, "gray")

return M
