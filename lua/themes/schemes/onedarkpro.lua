local M = {}

M.base_30 = {
  white = "#abb2bf",
  darker_black = "#1b1f27",
  black = "#1e222a", --  nvim bg
  black2 = "#252931",
  one_bg = "#282c34", -- real bg of onedark
  one_bg2 = "#353b45",
  one_bg3 = "#373b43",
  grey = "#42464e",
  grey_fg = "#565c64",
  grey_fg2 = "#6f737b",
  light_grey = "#6f737b",
  red = "#e06c75",
  baby_pink = "#DE8C92",
  pink = "#ff75a0",
  line = "#31353d", -- for lines like vertsplit
  green = "#98c379",
  vibrant_green = "#7eca9c",
  nord_blue = "#81A1C1",
  blue = "#61afef",
  yellow = "#e7c787",
  sun = "#EBCB8B",
  purple = "#de98fd",
  dark_purple = "#c882e7",
  teal = "#519ABA",
  orange = "#fca2aa",
  cyan = "#a3b8ef",
  statusline_bg = "#22262e",
  lightbg = "#2d3139",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
}

M.base_16 = {
  base00 = "#1e222a",
  base01 = "#353b45",
  base02 = "#3e4451",
  base03 = "#545862",
  base04 = "#565c64",
  base05 = "#abb2bf",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#e06c75",
  base09 = "#d19a66",
  base0A = "#e5c07b",
  base0B = "#98c379",
  base0C = "#56b6c2",
  base0D = "#61afef",
  base0E = "#c678dd",
  base0F = "#be5046",
}

M.polish_hl = {
  treesitter = {
    -- Identifiers
    ["@variable"] = { fg = M.base_30.red },
    ["@variable.builtin"] = { fg = M.base_30.yellow },
    ["@variable.parameter"] = { fg = M.base_30.red },
    ["@variable.member"] = { fg = M.base_30.red },

    ["@constant"] = { fg = M.base_30.orange },
    ["@constant.builtin"] = { fg = M.base_30.purple },
    ["@constant.macro"] = { fg = M.base_30.orange },

    ["@module"] = { fg = M.base_30.yellow },
    ["@label"] = { fg = M.base_30.blue },

    -- Literals
    ["@string"] = { fg = M.base_30.green },
    ["@string.regex"] = { fg = M.base_30.green },
    ["@string.escape"] = { fg = M.base_30.cyan },
    ["@string.special"] = { fg = M.base_30.orange },
    ["@string.special.symbol"] = { fg = M.base_30.red },
    ["@string.special.url"] = { fg = M.base_30.blue, underline = true, italic = true },

    ["@character"] = { fg = M.base_30.green },
    ["@character.special"] = { fg = M.base_30.purple },

    ["@boolean"] = { fg = M.base_30.orange },
    ["@number"] = { fg = M.base_30.orange },
    ["@number.float"] = { fg = M.base_30.orange },

    -- Types
    ["@type"] = { fg = M.base_30.yellow },
    ["@type.builtin"] = { fg = M.base_30.yellow },
    ["@type.definition"] = { fg = M.base_30.yellow },
    ["@type.qualifier"] = { fg = M.base_30.yellow },

    ["@attribute"] = { fg = M.base_30.purple },
    ["@property"] = { fg = M.base_30.red },

    -- Functions
    ["@function"] = { fg = M.base_30.blue },
    ["@function.builtin"] = { fg = M.base_30.yellow },
    ["@function.call"] = { fg = M.base_30.blue },
    ["@function.macro"] = { fg = M.base_30.blue },

    ["@function.method"] = { fg = M.base_30.blue },
    ["@function.method.call"] = { fg = M.base_30.blue },

    ["@constructor"] = { fg = M.base_30.yellow },
    ["@operator"] = { fg = M.base_30.cyan },

    -- Keywords
    ["@keyword"] = { fg = M.base_30.purple },
    ["@keyword.function"] = { fg = M.base_30.purple },
    ["@keyword.operator"] = { fg = M.base_30.purple },
    ["@keyword.import"] = { fg = M.base_30.purple },
    ["@keyword.repeat"] = { fg = M.base_30.purple },
    ["@keyword.return"] = { fg = M.base_30.purple },
    ["@keyword.exception"] = { fg = M.base_30.purple },
    ["@keyword.conditional"] = { fg = M.base_30.purple },

    -- Punctuation
    ["@punctuation.delimiter"] = { fg = M.base_30.white },
    ["@punctuation.bracket"] = { fg = M.base_30.purple },
    ["@punctuation.special"] = { fg = M.base_30.fg or M.base_16.base05 },

    -- Comments
    ["@comment"] = { fg = M.base_30.grey_fg, italic = true },
    ["@comment.error"] = { fg = M.base_30.red, bg = M.base_30.black },
    ["@comment.warning"] = { fg = M.base_30.yellow, bg = M.base_30.black },
    ["@comment.todo"] = { fg = M.base_30.blue, bg = M.base_30.black },
    ["@comment.note"] = { fg = M.base_30.cyan, bg = M.base_30.black },

    -- Markup
    ["@markup.strong"] = { fg = M.base_30.yellow, bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },

    ["@markup.heading"] = { fg = M.base_30.green, bold = true },
    ["@markup.math"] = { fg = M.base_30.orange },
    ["@markup.link.label"] = { fg = M.base_30.blue },
    ["@markup.link.url"] = { fg = M.base_30.purple },

    ["@markup.raw"] = { fg = M.base_30.green },
    ["@markup.raw.delimiter"] = { fg = M.base_30.grey },

    ["@markup.list"] = { fg = M.base_30.red },
    ["@markup.list.checked"] = { fg = M.base_30.purple },
    ["@markup.list.unchecked"] = { fg = M.base_30.white },

    -- Tags
    ["@tag"] = { fg = M.base_30.red },
    ["@tag.attribute"] = { fg = M.base_30.red },
    ["@tag.delimiter"] = { fg = M.base_30.white },
  },
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "onedarkpro")

return M
