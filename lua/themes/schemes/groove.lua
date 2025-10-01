local M = {}

M.base_30 = {
  white = "#fbf1c7",
  darker_black = "#17191a",
  black = "#1e2122", -- nvim bg
  black2 = "#222627",
  one_bg = "#282c2d", -- real bg
  one_bg2 = "#2d3132",
  one_bg3 = "#333738",
  grey = "#333739",
  grey_fg = "#a89984",
  grey_fg2 = "#bdae93",
  light_grey = "#d4be98",
  red = "#ec6b64",
  baby_pink = "#ec635c",
  pink = "#cc7f94",
  line = "#222627", -- for lines like vertsplit
  green = "#89b482",
  vibrant_green = "#7fb477",
  nord_blue = "#6f8faf",
  blue = "#6289af",
  yellow = "#d69d76",
  sun = "#d69569",
  purple = "#cc768e",
  dark_purple = "#cc7f94",
  teal = "#6facaf",
  orange = "#d69d76",
  cyan = "#6cacaf",
  statusline_bg = "#222627",
  lightbg = "#282c2d",
  pmenu_bg = "#6f8faf",
  folder_bg = "#6f8faf",
}

M.base_16 = {
  base00 = "#1e2122", -- background
  base01 = "#222627",
  base02 = "#282c2d",
  base03 = "#928374",
  base04 = "#a89984",
  base05 = "#fbf1c7", -- foreground
  base06 = "#d4be98",
  base07 = "#bdae93",
  base08 = "#ec6b64", -- red
  base09 = "#d69d76", -- orange
  base0A = "#d69569", -- yellow
  base0B = "#89b482", -- green
  base0C = "#6facaf", -- teal
  base0D = "#6f8faf", -- blue
  base0E = "#cc7f94", -- purple
  base0F = "#ec635c", -- pink/red alt
}

M.polish_hl = {
  treesitter = {
    TSAttribute = { fg = M.base_30.blue },
    TSBoolean = { fg = M.base_30.nord_blue },
    TSCharacter = { fg = M.base_30.blue },
    TSComment = { fg = M.base_30.grey, italic = true },
    TSConditional = { fg = M.base_30.red },
    TSConstant = { fg = M.base_30.nord_blue },
    TSConstBuiltin = { fg = M.base_30.blue },
    TSConstMacro = { fg = M.base_30.yellow },
    TSConstructor = { fg = M.base_30.blue },
    TSException = { fg = M.base_30.orange },
    TSField = { fg = M.base_30.red },
    TSFloat = { fg = M.base_30.orange },
    TSFunction = { fg = M.base_30.red },
    TSFuncBuiltin = { fg = M.base_30.cyan },
    TSFuncMacro = { fg = M.base_30.green },
    TSInclude = { fg = M.base_30.purple },
    TSKeyword = { fg = M.base_30.purple },
    TSKeywordFunction = { fg = M.base_30.blue },
    TSKeywordOperator = { fg = M.base_30.nord_blue },
    TSKeywordReturn = { fg = M.base_30.blue },
    TSLabel = { fg = M.base_30.blue },
    TSMethod = { fg = M.base_30.nord_blue },
    TSNamespace = { fg = M.base_30.purple },
    TSNumber = { fg = M.base_30.yellow },
    TSParameter = { fg = M.base_30.red },
    TSParameterReference = { fg = M.base_30.purple },
    TSProperty = { fg = M.base_30.red },
    TSPunctDelimiter = { fg = M.base_30.blue },
    TSPunctBracket = { fg = M.base_30.blue },
    TSPunctSpecial = { fg = M.base_30.blue },
    TSRepeat = { fg = M.base_30.teal },
    TSString = { fg = M.base_30.green },
    TSStringRegex = { fg = M.base_30.green },
    TSStringEscape = { fg = M.base_30.blue },
    TSStringSpecial = { fg = M.base_30.blue },
    TSSymbol = { fg = M.base_30.red },
    TSTag = { fg = M.base_30.blue },
    TSTagAttribute = { fg = M.base_30.red },
    TSTagDelimiter = { fg = M.base_30.blue },
    TSText = { fg = M.base_30.white },
    TSStrong = { fg = M.base_30.white },
    TSEmphasis = { italic = true, fg = M.base_30.white },
    TSUnderline = { fg = M.base_30.purple },
    TSStrike = { fg = M.base_30.white },
    TSTitle = { fg = M.base_30.yellow },
    TSLiteral = { fg = M.base_30.green },
    TSURI = { fg = M.base_30.yellow },
    TSMath = { fg = M.base_30.nord_blue },
    TSTextReference = { fg = M.base_30.nord_blue },
    TSEnvironment = { fg = M.base_30.purple },
    TSEnvironmentName = { fg = M.base_30.yellow },
    TSNote = { fg = M.base_30.orange },
    TSWarning = { fg = M.base_30.black, bg = M.base_30.red },
    TSDanger = { fg = M.base_30.orange },
    TSType = { fg = M.base_30.yellow },
    TSTypeBuiltin = { fg = M.base_30.yellow },
    TSVariable = { fg = M.base_30.white },
    TSVariableBuiltin = { fg = M.base_30.blue },
  },
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "groove")

return M
