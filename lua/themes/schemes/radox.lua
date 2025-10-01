local M = {}

M.base_30 = {
  white = "#bebec7",
  darker_black = "#0c0f12",
  black = "#101419", -- nvim bg
  black2 = "#111419",
  one_bg = "#181c24", -- real bg
  one_bg2 = "#1c2228",
  one_bg3 = "#222830",
  grey = "#222839",
  grey_fg = "#6b7684",
  grey_fg2 = "#89939f",
  light_grey = "#90909e",
  red = "#f87070",
  baby_pink = "#fb7373",
  pink = "#c397d8",
  line = "#111419", -- for lines like vertsplit
  green = "#79dcaa",
  vibrant_green = "#36c692",
  nord_blue = "#7ab0df",
  blue = "#5fb0fc",
  yellow = "#ffe59e",
  sun = "#fccf67",
  purple = "#b77ee0",
  dark_purple = "#c397d8",
  teal = "#70c0ba",
  orange = "#fccf67",
  cyan = "#54c3d6",
  statusline_bg = "#111419",
  lightbg = "#181c24",
  pmenu_bg = "#7ab0df",
  folder_bg = "#7ab0df",
}

M.base_16 = {
  base00 = "#101419", -- background
  base01 = "#111419",
  base02 = "#181c24",
  base03 = "#515c68",
  base04 = "#6b7684",
  base05 = "#a4a4a4", -- foreground
  base06 = "#cdcdcd",
  base07 = "#cdcdcd",
  base08 = "#f87070", -- red
  base09 = "#fccf67", -- orange
  base0A = "#ffe59e", -- yellow
  base0B = "#79dcaa", -- green
  base0C = "#70c0ba", -- teal
  base0D = "#7ab0df", -- blue
  base0E = "#c397d8", -- purple
  base0F = "#fb7373", -- pink/red alt
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

M = require("themes").override_theme(M, "radox")

return M
