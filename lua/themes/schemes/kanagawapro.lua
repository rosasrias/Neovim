local M = {}

M.base_30 = {
  white = "#ded9bc",
  darker_black = "#0d0d11",
  black = "#121218", -- nvim bg
  black2 = "#16161d",
  one_bg = "#1F1F28", -- real bg
  one_bg2 = "#2A2A37",
  one_bg3 = "#32323f",
  grey = "#32323a",
  grey_fg = "#6a6a82",
  grey_fg2 = "#8c8ca3",
  light_grey = "#d1ccb1",
  red = "#ee5257",
  baby_pink = "#e15a5f",
  pink = "#987ebf",
  line = "#16161d", -- for lines like vertsplit
  green = "#6bbca5",
  vibrant_green = "#6cb49f",
  nord_blue = "#7694d1",
  blue = "#7a96cd",
  yellow = "#f0965f",
  sun = "#df8f5e",
  purple = "#9478bf",
  dark_purple = "#987ebf",
  teal = "#7FB4CA",
  orange = "#f0965f",
  cyan = "#70aac2",
  statusline_bg = "#16161d",
  lightbg = "#1F1F28",
  pmenu_bg = "#7694d1",
  folder_bg = "#7694d1",
}

M.base_16 = {
  base00 = "#121218", -- background
  base01 = "#16161d",
  base02 = "#1F1F28",
  base03 = "#54546D",
  base04 = "#6a6a82",
  base05 = "#ded9bc", -- foreground
  base06 = "#d7d2b5",
  base07 = "#d1ccb1",
  base08 = "#ee5257", -- red
  base09 = "#f0965f", -- orange
  base0A = "#df8f5e", -- yellow
  base0B = "#6bbca5", -- green
  base0C = "#7FB4CA", -- teal
  base0D = "#7694d1", -- blue
  base0E = "#987ebf", -- purple
  base0F = "#e15a5f", -- pink/red alt
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

M = require("themes").override_theme(M, "kanagawapro")

return M
