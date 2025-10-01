local M = {}

M.base_30 = {
  white = "#dee1e6",
  darker_black = "#0e1114",
  black = "#13161a", -- nvim bg
  black2 = "#14171b",
  one_bg = "#21262e", -- real bg
  one_bg2 = "#242931",
  one_bg3 = "#2a2f37",
  grey = "#2a2f39",
  grey_fg = "#6b7684",
  grey_fg2 = "#9ca3af",
  light_grey = "#BFBFBF",
  red = "#cd5667",
  baby_pink = "#e26c7c",
  pink = "#b47fd7",
  line = "#14171b", -- for lines like vertsplit
  green = "#66cd99",
  vibrant_green = "#78DBA9",
  nord_blue = "#7297d9",
  blue = "#86aaec",
  yellow = "#d78e6c",
  sun = "#e9a180",
  purple = "#b47fd7",
  dark_purple = "#c68aee",
  teal = "#8bbce6",
  orange = "#e9a180",
  cyan = "#9cd1ff",
  statusline_bg = "#14171b",
  lightbg = "#21262e",
  pmenu_bg = "#7297d9",
  folder_bg = "#7297d9",
}

M.base_16 = {
  base00 = "#13161a", -- background
  base01 = "#14171b",
  base02 = "#21262e",
  base03 = "#485263",
  base04 = "#6b7684",
  base05 = "#dee1e6", -- foreground
  base06 = "#BFBFBF",
  base07 = "#C1C4CB",
  base08 = "#cd5667", -- red
  base09 = "#e9a180", -- orange
  base0A = "#d78e6c", -- yellow
  base0B = "#66cd99", -- green
  base0C = "#8bbce6", -- teal
  base0D = "#7297d9", -- blue
  base0E = "#b47fd7", -- purple
  base0F = "#e26c7c", -- pink/red alt
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

M = require("themes").override_theme(M, "cay")

return M
