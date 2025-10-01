local M = {}

M.base_30 = {
  white = "#cdcecf",
  darker_black = "#0d141e",
  black = "#141c27", -- nvim bg
  black2 = "#192029",
  one_bg = "#202a37", -- real bg
  one_bg2 = "#262e3f",
  one_bg3 = "#2d3647",
  grey = "#2d3649",
  grey_fg = "#606372",
  grey_fg2 = "#7a828f",
  light_grey = "#8c939f",
  red = "#c54766",
  baby_pink = "#d75978",
  pink = "#a589d2",
  line = "#192029", -- for lines like vertsplit
  green = "#81b69c",
  vibrant_green = "#92bfa8",
  nord_blue = "#6f9fdf",
  blue = "#83abe0",
  yellow = "#f4987c",
  sun = "#ea9e87",
  purple = "#b496e3",
  dark_purple = "#a589d2",
  teal = "#91dadc",
  orange = "#f4987c",
  cyan = "#9dcecf",
  statusline_bg = "#192029",
  lightbg = "#202a37",
  pmenu_bg = "#6f9fdf",
  folder_bg = "#6f9fdf",
}

M.base_16 = {
  base00 = "#141c27", -- background
  base01 = "#192029",
  base02 = "#202a37",
  base03 = "#535d6a",
  base04 = "#606372",
  base05 = "#cdcecf", -- foreground
  base06 = "#8c939f",
  base07 = "#606372",
  base08 = "#c54766", -- red
  base09 = "#f4987c", -- orange
  base0A = "#ea9e87", -- yellow
  base0B = "#81b69c", -- green
  base0C = "#91dadc", -- teal
  base0D = "#6f9fdf", -- blue
  base0E = "#a589d2", -- purple
  base0F = "#d75978", -- pink/red alt
}

M.polish_hl = {
  treesitter = {
    TSAttribute = { fg = M.base_30.blue },
    TSBoolean = { fg = M.base_30.nord_blue },
    TSCharacter = { fg = M.base_30.blue },
    TSComment = { fg = M.base_30.grey_fg, italic = true },
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

M = require("themes").override_theme(M, "fox")

return M
