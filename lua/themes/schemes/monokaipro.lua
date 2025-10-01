local M = {}

M.base_30 = {
  white = "#DDDFE4",
  darker_black = "#181618",
  black = "#1c191c", -- nvim bg
  black2 = "#19181a",
  one_bg = "#221f22", -- real bg
  one_bg2 = "#2d2a2e",
  one_bg3 = "#333036",
  grey = "#333039",
  grey_fg = "#a0a0a0",
  grey_fg2 = "#b0b0b0",
  light_grey = "#c6c8cc",
  red = "#ff6188",
  baby_pink = "#ed6587",
  pink = "#ab9df2",
  line = "#19181a", -- for lines like vertsplit
  green = "#a9dc76",
  vibrant_green = "#aedb82",
  nord_blue = "#789ce8",
  blue = "#88a2db",
  yellow = "#fc9867",
  sun = "#ef9e76",
  purple = "#beb1ff",
  dark_purple = "#ab9df2",
  teal = "#78dce8",
  orange = "#fc9867",
  cyan = "#8bd7e0",
  statusline_bg = "#19181a",
  lightbg = "#221f22",
  pmenu_bg = "#789ce8",
  folder_bg = "#789ce8",
}

M.base_16 = {
  base00 = "#1c191c", -- background
  base01 = "#19181a",
  base02 = "#221f22",
  base03 = "#939293",
  base04 = "#a0a0a0",
  base05 = "#DDDFE4", -- foreground
  base06 = "#d6d8dd",
  base07 = "#c6c8cc",
  base08 = "#ff6188", -- red
  base09 = "#fc9867", -- orange
  base0A = "#ef9e76", -- yellow
  base0B = "#a9dc76", -- green
  base0C = "#78dce8", -- teal
  base0D = "#789ce8", -- blue
  base0E = "#ab9df2", -- purple
  base0F = "#ed6587", -- pink/red alt
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

M = require("themes").override_theme(M, "monokaipro")

return M
