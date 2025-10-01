local M = {}

M.base_30 = {
  white = "#e0def4",
  darker_black = "#13111e",
  black = "#191724", -- nvim bg
  black2 = "#1f1d2e",
  one_bg = "#26233a", -- real bg
  one_bg2 = "#2d2a40",
  one_bg3 = "#332f46",
  grey = "#332f47",
  grey_fg = "#908caa",
  grey_fg2 = "#a4a0c0",
  light_grey = "#b5bfe2",
  red = "#ea5780",
  baby_pink = "#ee6a8f",
  pink = "#b495db",
  line = "#26233a", -- for lines like vertsplit
  green = "#93e49d",
  vibrant_green = "#9ee6a7",
  nord_blue = "#7cb2bb",
  blue = "#8ac1ca",
  yellow = "#fdb482",
  sun = "#f0ac7c",
  purple = "#c1a0ea",
  dark_purple = "#b495db",
  teal = "#92cad4",
  orange = "#fdb482",
  cyan = "#9ad7e1",
  statusline_bg = "#1f1d2e",
  lightbg = "#26233a",
  pmenu_bg = "#7cb2bb",
  folder_bg = "#7cb2bb",
}

M.base_16 = {
  base00 = "#191724", -- background
  base01 = "#1f1d2e",
  base02 = "#26233a",
  base03 = "#6e6a86",
  base04 = "#908caa",
  base05 = "#e0def4", -- foreground
  base06 = "#b5bfe2",
  base07 = "#908caa",
  base08 = "#ea5780", -- red
  base09 = "#fdb482", -- orange
  base0A = "#f0ac7c", -- yellow
  base0B = "#93e49d", -- green
  base0C = "#92cad4", -- teal
  base0D = "#7cb2bb", -- blue
  base0E = "#b495db", -- purple
  base0F = "#ee6a8f", -- pink/red alt
}

M.polish_hl = {
  treesitter = {
    TSAttribute = { fg = M.base_30.blue },
    TSBoolean = { fg = M.base_30.nord_blue },
    TSCharacter = { fg = M.base_30.blue },
    TSComment = { fg = M.base_30.comment, italic = true },
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
    TSInclude = { fg = M.base_30.deep_purple },
    TSKeyword = { fg = M.base_30.purple },
    TSKeywordFunction = { fg = M.base_30.blue },
    TSKeywordOperator = { fg = M.base_30.nord_blue },
    TSKeywordReturn = { fg = M.base_30.blue },
    TSLabel = { fg = M.base_30.blue },
    TSMethod = { fg = M.base_30.nord_blue },
    TSNamespace = { fg = M.base_30.deep_purple },
    TSNumber = { fg = M.base_30.yellow },
    TSParameter = { fg = M.base_30.red },
    TSParameterReference = { fg = M.base_30.deep_purple },
    TSProperty = { fg = M.base_30.red },
    TSPunctDelimiter = { fg = M.base_30.light_blue },
    TSPunctBracket = { fg = M.base_30.light_blue },
    TSPunctSpecial = { fg = M.base_30.light_blue },
    TSRepeat = { fg = M.base_30.teal },
    TSString = { fg = M.base_30.green },
    TSStringRegex = { fg = M.base_30.green },
    TSStringEscape = { fg = M.base_30.blue },
    TSStringSpecial = { fg = M.base_30.blue },
    TSSymbol = { fg = M.base_30.red },
    TSTag = { fg = M.base_30.blue },
    TSTagAttribute = { fg = M.base_30.red },
    TSTagDelimiter = { fg = M.base_30.light_blue },
    TSText = { fg = M.base_30.light_blue },
    TSStrong = { fg = M.base_30.light_blue },
    TSEmphasis = { italic = true, fg = M.base_30.light_blue },
    TSUnderline = { fg = M.base_30.purple },
    TSStrike = { fg = M.base_30.light_blue },
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
    TSVariable = { fg = M.base_30.light_blue },
    TSVariableBuiltin = { fg = M.base_30.blue },
  },
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "rose")

return M
