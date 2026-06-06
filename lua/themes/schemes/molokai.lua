---@type Base46Table
local M = {}

M.base_30 = {
  white = "#ffffff",
  black = "#1c1e1f",
  darker_black = "#151617",
  black2 = "#1d1f20",
  one_bg = "#222323",
  one_bg2 = "#2d2e2e",
  one_bg3 = "#4e4e4e",

  grey = "#525254",
  grey_fg = "#555556",
  grey_fg2 = "#767679",
  light_grey = "#cfc0c5",

  red = "#e74c3c",
  baby_pink = "#fb2874",
  pink = "#9c91e4",

  line = "#2d2e2e",

  green = "#b6e63e",
  vibrant_green = "#c4f04f",

  nord_blue = "#727280",
  blue = "#268bd2",
  seablue = "#66d9ef",

  yellow = "#e2c770",
  sun = "#f0d98a",

  purple = "#9c91e4",
  dark_purple = "#7e73d6",

  teal = "#66d9ef",
  orange = "#fd971f",
  cyan = "#66d9ef",

  statusline_bg = "#222323",
  lightbg = "#2d2e2e",

  pmenu_bg = "#66d9ef",
  folder_bg = "#268bd2",
}

M.base_16 = {
  base00 = "#1c1e1f",
  base01 = "#222323",
  base02 = "#2d2e2e",
  base03 = "#525254",
  base04 = "#767679",
  base05 = "#d6d6d4",
  base06 = "#cfc0c5",
  base07 = "#ffffff",

  base08 = "#e74c3c",
  base09 = "#fd971f",
  base0A = "#e2c770",
  base0B = "#b6e63e",
  base0C = "#66d9ef",
  base0D = "#268bd2",
  base0E = "#9c91e4",
  base0F = "#fb2874",
}

M.polish_hl = {
  defaults = {
    Comment = {
      fg = "#555556",
      italic = true,
    },

    CursorLine = {
      bg = "#222323",
    },

    Visual = {
      bg = "#4e4e4e",
    },

    LineNr = {
      fg = "#555556",
    },

    CursorLineNr = {
      fg = "#cfc0c5",
      bold = true,
    },
  },

  treesitter = {
    ["@keyword"] = { fg = "#fb2874" },
    ["@function"] = { fg = "#b6e63e" },
    ["@method"] = { fg = "#66d9ef" },
    ["@type"] = { fg = "#66d9ef" },
    ["@string"] = { fg = "#e2c770" },
    ["@number"] = { fg = "#9c91e4" },
    ["@constant"] = { fg = "#fd971f" },
    ["@variable"] = { fg = "#fd971f" },
    ["@operator"] = { fg = "#9c91e4" },
  },
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "molokai")

return M
