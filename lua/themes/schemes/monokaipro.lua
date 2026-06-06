local M = {}

M.base_30 = {
  white = "#FCFCFA",
  black = "#2D2A2E", -- bg
  darker_black = "#221F22",
  black2 = "#19181A",
  one_bg = "#1B1B1B",
  one_bg2 = "#282528",
  one_bg3 = "#2B2B2B",

  grey = "#4C4A4D",
  grey_fg = "#727072",
  grey_fg2 = "#939293",
  light_grey = "#c1c0c0",

  red = "#FF6188",
  baby_pink = "#FC9867",
  pink = "#AB9DF2",

  line = "#383539",

  green = "#A9DC76",
  vibrant_green = "#B4E87F",

  nord_blue = "#81A2BE",
  blue = "#78DCE8",
  seablue = "#78DCE8",

  yellow = "#FFD866",
  sun = "#FFE27A",

  purple = "#AB9DF2",
  dark_purple = "#8B7FE3",

  teal = "#A9DC76",
  orange = "#FC9867",
  cyan = "#78DCE8",

  statusline_bg = "#221F22",
  lightbg = "#2B2B2B",

  pmenu_bg = "#78DCE8",
  folder_bg = "#78DCE8",
}

M.base_16 = {
  base00 = "#2D2A2E",
  base01 = "#221F22",
  base02 = "#1B1B1B",
  base03 = "#4C4A4D",
  base04 = "#727072",
  base05 = "#FCFCFA",
  base06 = "#FCFCFA",
  base07 = "#FFFFFF",

  base08 = "#FF6188", -- variables, errors
  base09 = "#FC9867", -- numbers
  base0A = "#FFD866", -- classes
  base0B = "#A9DC76", -- strings
  base0C = "#78DCE8", -- support
  base0D = "#78DCE8", -- functions
  base0E = "#AB9DF2", -- keywords
  base0F = "#CC6666", -- deprecated
}

M.polish_hl = {
  defaults = {
    Comment = {
      fg = "#727072",
      italic = true,
    },

    CursorLine = {
      bg = "#2B2B2B",
    },

    Visual = {
      bg = "#383539",
    },
  },

  treesitter = {
    ["@variable"] = { fg = "#78dce8" },
    ["@string"] = { fg = "#FFD866" },
    ["@function"] = { fg = "#a6c887" },
    ["@function.call"] = { fg = "#a6c887" },
    ["@module"] = { fg = "#AB9DF2" },
    ["@type"] = { fg = "#78dce8" },
    ["@constant"] = { fg = "#FC9867" },
    ["@keyword"] = { fg = "#ef628a" },
    ["@links"] = { fg = "#ef628a" },
    ["@type.builtin"] = { fg = "#78dce8" },
  },
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "monokai_pro")

return M
