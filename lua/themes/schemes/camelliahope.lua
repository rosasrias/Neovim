local M = {}

M.base_30 = {
  white = "#acacac",
  darker_black = "#101013",
  black = "#17181C", -- nvim bg
  black2 = "#1E1F24",
  one_bg = "#26272B", -- real bg
  one_bg2 = "#333438",
  one_bg3 = "#3d3e42",
  grey = "#3d3e49",
  grey_fg = "#8b8b90",
  grey_fg2 = "#b6b7ba",
  light_grey = "#b0b1b4",
  red = "#FA3867",
  baby_pink = "#FA3867",
  pink = "#A771EF",
  line = "#1E1F24", -- for lines like vertsplit
  green = "#65DB3D",
  vibrant_green = "#65DB3D",
  nord_blue = "#4CB2E5",
  blue = "#4CB2E5",
  yellow = "#F57F3D",
  sun = "#F57F3D",
  purple = "#A771EF",
  dark_purple = "#A771EF",
  teal = "#53DFCA",
  orange = "#F57F3D",
  cyan = "#53DFCA",
  statusline_bg = "#1E1F24",
  lightbg = "#26272B",
  pmenu_bg = "#4CB2E5",
  folder_bg = "#4CB2E5",
}

M.base_16 = {
  base00 = "#17181C", -- background
  base01 = "#1E1F24",
  base02 = "#26272B",
  base03 = "#8f9093",
  base04 = "#838383",
  base05 = "#a3a3a6", -- foreground
  base06 = "#a3a3a6",
  base07 = "#a3a3a6",
  base08 = "#FA3867", -- red
  base09 = "#F57F3D", -- orange
  base0A = "#F57F3D", -- yellow
  base0B = "#65DB3D", -- green
  base0C = "#53DFCA", -- teal
  base0D = "#4CB2E5", -- blue
  base0E = "#A771EF", -- purple
  base0F = "#FA3867", -- pink/red alt
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

M = require("themes").override_theme(M, "camelliahope")

return M
