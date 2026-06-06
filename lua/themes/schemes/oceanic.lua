---@type Base46Table
local M = {}

M.base_30 = {
  white = "#D8DEE9",
  black = "#1B2B34",
  darker_black = "#14232D",
  black2 = "#21313a",
  one_bg = "#25353e",
  one_bg2 = "#2e3e47",
  one_bg3 = "#36464f",
  grey = "#43535c",
  grey_fg = "#4d5d66",
  grey_fg2 = "#576770",
  light_grey = "#5f6f78",

  red = "#EC5F67",
  baby_pink = "#E27E8D",
  pink = "#C594C5",

  line = "#343D46",

  green = "#99C794",
  vibrant_green = "#5FB3B3",

  nord_blue = "#6699CC",
  blue = "#6699CC",
  seablue = "#5FB3B3",

  yellow = "#FAC863",
  sun = "#FFD479",

  purple = "#C594C5",
  dark_purple = "#A97EA9",

  teal = "#5FB3B3",
  orange = "#F99157",
  cyan = "#5FB3B3",

  statusline_bg = "#14232D",
  lightbg = "#343D46",

  pmenu_bg = "#6699CC",
  folder_bg = "#6699CC",
}

M.base_16 = {
  base00 = "#1B2B34",
  base01 = "#343D46",
  base02 = "#4F5B66",
  base03 = "#65737E",
  base04 = "#A7ADBA",
  base05 = "#C0C5CE",
  base06 = "#CDD3DE",
  base07 = "#D8DEE9",

  base08 = "#EC5F67",
  base09 = "#F99157",
  base0A = "#FAC863",
  base0B = "#99C794",
  base0C = "#5FB3B3",
  base0D = "#6699CC",
  base0E = "#C594C5",
  base0F = "#E27E8D",
}

M.polish_hl = {
  defaults = {
    Comment = {
      fg = "#65737E",
      italic = true,
    },

    CursorLine = {
      bg = "#343D46",
    },

    Visual = {
      bg = "#4F5B66",
    },

    CursorLineNr = {
      fg = "#D8DEE9",
      bold = true,
    },

    FloatBorder = {
      fg = "#4F5B66",
    },

    PmenuSel = {
      bg = "#6699CC",
      fg = "#1B2B34",
    },
  },

  treesitter = {
    ["@keyword"] = { fg = "#C594C5" },
    ["@function"] = { fg = "#6699CC" },
    ["@method"] = { fg = "#6699CC" },
    ["@string"] = { fg = "#99C794" },
    ["@number"] = { fg = "#F99157" },
    ["@constant"] = { fg = "#F99157" },
    ["@type"] = { fg = "#FAC863" },
    ["@operator"] = { fg = "#5FB3B3" },
    ["@variable"] = { fg = "#F99157" },
    ["@property"] = { fg = "#99C794" },
    ["@parameter"] = { fg = "#C0C5CE" },
  },
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "oceanic")

return M
