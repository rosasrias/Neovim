local M = {}

M.base_30 = {
  white = "#d3c2b1",
  darker_black = "#151a1c",
  black = "#1b2124", -- nvim bg
  black2 = "#22292d",
  one_bg = "#2e383d", -- real bg
  one_bg2 = "#313b41",
  one_bg3 = "#374147",
  grey = "#374149",
  grey_fg = "#7c7a7a",
  grey_fg2 = "#9d9b9b",
  light_grey = "#838383",
  red = "#ce6568",
  baby_pink = "#e76365",
  pink = "#d699b6",
  line = "#22292d", -- for lines like vertsplit
  green = "#8dc080",
  vibrant_green = "#7cc277",
  nord_blue = "#85b7b0",
  blue = "#7fbbb3",
  yellow = "#d29571",
  sun = "#d69571",
  purple = "#d491b1",
  dark_purple = "#d699b6",
  teal = "#90bd9b",
  orange = "#d29571",
  cyan = "#7ab98a",
  statusline_bg = "#22292d",
  lightbg = "#2e383d",
  pmenu_bg = "#85b7b0",
  folder_bg = "#85b7b0",
}

M.base_16 = {
  base00 = "#1b2124", -- background
  base01 = "#22292d",
  base02 = "#2e383d",
  base03 = "#5a5858",
  base04 = "#7c7a7a",
  base05 = "#d0c4ae", -- foreground
  base06 = "#d3c6aa",
  base07 = "#b7c1c1",
  base08 = "#ce6568", -- red
  base09 = "#d29571", -- orange
  base0A = "#d69571", -- yellow
  base0B = "#8dc080", -- green
  base0C = "#90bd9b", -- teal
  base0D = "#85b7b0", -- blue
  base0E = "#d699b6", -- purple
  base0F = "#e76365", -- pink/red alt
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

M = require("themes").override_theme(M, "forest")

return M
