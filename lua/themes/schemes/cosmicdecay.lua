local M = {}

M.base_30 = {
  white = "#DDDFE4",
  darker_black = "#101119",
  black = "#12131c", -- nvim bg
  black2 = "#1b1d2a",
  one_bg = "#272935", -- real bg
  one_bg2 = "#2b2d3a",
  one_bg3 = "#343750",
  grey = "#343759",
  grey_fg = "#BFBFBF",
  grey_fg2 = "#C1C4CB",
  light_grey = "#DDDFE4",
  red = "#CA7E9E",
  baby_pink = "#E3879C",
  pink = "#C7A5E5",
  line = "#1b1d2a", -- for lines like vertsplit
  green = "#8FC8A8",
  vibrant_green = "#A1D4BB",
  nord_blue = "#8CACEF",
  blue = "#94B4EF",
  yellow = "#FFC19F",
  sun = "#FFC19F",
  purple = "#C7A5E5",
  dark_purple = "#CC9EEF",
  teal = "#8dccb7",
  orange = "#FFC19F",
  cyan = "#A3D2E7",
  statusline_bg = "#1b1d2a",
  lightbg = "#272935",
  pmenu_bg = "#8CACEF",
  folder_bg = "#8CACEF",
}

M.base_16 = {
  base00 = "#12131c", -- background
  base01 = "#1b1d2a",
  base02 = "#272935",
  base03 = "#343750",
  base04 = "#BFBFBF",
  base05 = "#DDDFE4", -- foreground
  base06 = "#C1C4CB",
  base07 = "#DDDFE4",
  base08 = "#CA7E9E", -- red
  base09 = "#FFC19F", -- orange
  base0A = "#FFC19F", -- yellow
  base0B = "#8FC8A8", -- green
  base0C = "#8dccb7", -- teal
  base0D = "#8CACEF", -- blue
  base0E = "#C7A5E5", -- purple
  base0F = "#E3879C", -- pink/red alt
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

M = require("themes").override_theme(M, "cosmicdecay")

return M
