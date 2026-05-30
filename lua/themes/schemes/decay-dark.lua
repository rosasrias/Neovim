local M = {}

M.base_30 = {
  white = "#c5cdd9",
  darker_black = "#0b0d15",
  black = "#0d0f18", -- nvim bg
  black2 = "#151924",
  one_bg = "#1b1f2a",
  one_bg2 = "#232734",
  one_bg3 = "#2b3040",
  grey = "#3a4052",
  grey_fg = "#4c546a",
  grey_fg2 = "#5d6680",
  light_grey = "#6b7490",

  red = "#dd6777",
  baby_pink = "#e08b99",
  pink = "#ff7aa2",

  line = "#252a38",

  green = "#90ceaa",
  vibrant_green = "#a5d6b4",

  nord_blue = "#86aaec",
  blue = "#86aaec",

  yellow = "#ecd3a0",
  sun = "#f0d7a7",

  purple = "#c296eb",
  dark_purple = "#ae7fe0",

  teal = "#8bd5ca",
  orange = "#f5a97f",
  cyan = "#93cee9",

  statusline_bg = "#121520",
  lightbg = "#202431",

  pmenu_bg = "#86aaec",
  folder_bg = "#86aaec",
}

M.base_16 = {
  base00 = "#0d0f18",
  base01 = "#151924",
  base02 = "#1b1f2a",
  base03 = "#3a4052",
  base04 = "#5d6680",
  base05 = "#c5cdd9",
  base06 = "#d6dbe4",
  base07 = "#ffffff",

  base08 = "#dd6777",
  base09 = "#f5a97f",
  base0A = "#ecd3a0",
  base0B = "#90ceaa",
  base0C = "#93cee9",
  base0D = "#86aaec",
  base0E = "#c296eb",
  base0F = "#e08b99",
}

M.polish_hl = {
  treesitter = {
    -- Identifiers
    ["@variable"] = { fg = M.base_30.red },
    ["@variable.builtin"] = { fg = M.base_30.yellow },
    ["@variable.parameter"] = { fg = M.base_30.red },
    ["@variable.member"] = { fg = M.base_30.red },

    ["@constant"] = { fg = M.base_30.orange },
    ["@constant.builtin"] = { fg = M.base_30.purple },
    ["@constant.macro"] = { fg = M.base_30.orange },

    ["@module"] = { fg = M.base_30.yellow },
    ["@label"] = { fg = M.base_30.blue },

    -- Literals
    ["@string"] = { fg = M.base_30.green },
    ["@string.regex"] = { fg = M.base_30.green },
    ["@string.escape"] = { fg = M.base_30.cyan },
    ["@string.special"] = { fg = M.base_30.orange },
    ["@string.special.symbol"] = { fg = M.base_30.red },
    ["@string.special.url"] = {
      fg = M.base_30.blue,
      underline = true,
      italic = true,
    },

    ["@character"] = { fg = M.base_30.green },
    ["@character.special"] = { fg = M.base_30.purple },

    ["@boolean"] = { fg = M.base_30.orange },
    ["@number"] = { fg = M.base_30.orange },
    ["@number.float"] = { fg = M.base_30.orange },

    -- Types
    ["@type"] = { fg = M.base_30.yellow },
    ["@type.builtin"] = { fg = M.base_30.yellow },
    ["@type.definition"] = { fg = M.base_30.yellow },
    ["@type.qualifier"] = { fg = M.base_30.yellow },

    ["@attribute"] = { fg = M.base_30.purple },
    ["@property"] = { fg = M.base_30.red },

    -- Functions
    ["@function"] = { fg = M.base_30.blue },
    ["@function.builtin"] = { fg = M.base_30.yellow },
    ["@function.call"] = { fg = M.base_30.blue },
    ["@function.macro"] = { fg = M.base_30.blue },

    ["@function.method"] = { fg = M.base_30.blue },
    ["@function.method.call"] = { fg = M.base_30.blue },

    ["@constructor"] = { fg = M.base_30.yellow },
    ["@operator"] = { fg = M.base_30.cyan },

    -- Keywords
    ["@keyword"] = { fg = M.base_30.purple },
    ["@keyword.function"] = { fg = M.base_30.purple },
    ["@keyword.operator"] = { fg = M.base_30.purple },
    ["@keyword.import"] = { fg = M.base_30.purple },
    ["@keyword.repeat"] = { fg = M.base_30.purple },
    ["@keyword.return"] = { fg = M.base_30.purple },
    ["@keyword.exception"] = { fg = M.base_30.purple },
    ["@keyword.conditional"] = { fg = M.base_30.purple },

    -- Punctuation
    ["@punctuation.delimiter"] = { fg = M.base_30.white },
    ["@punctuation.bracket"] = { fg = M.base_30.purple },
    ["@punctuation.special"] = {
      fg = M.base_30.fg or M.base_16.base05,
    },

    -- Comments
    ["@comment"] = {
      fg = M.base_30.grey_fg,
      italic = true,
    },

    ["@comment.error"] = {
      fg = M.base_30.red,
      bg = M.base_30.black,
    },

    ["@comment.warning"] = {
      fg = M.base_30.yellow,
      bg = M.base_30.black,
    },

    ["@comment.todo"] = {
      fg = M.base_30.blue,
      bg = M.base_30.black,
    },

    ["@comment.note"] = {
      fg = M.base_30.cyan,
      bg = M.base_30.black,
    },

    -- Markup
    ["@markup.strong"] = {
      fg = M.base_30.yellow,
      bold = true,
    },

    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },

    ["@markup.heading"] = {
      fg = M.base_30.green,
      bold = true,
    },

    ["@markup.math"] = { fg = M.base_30.orange },

    ["@markup.link.label"] = {
      fg = M.base_30.blue,
    },

    ["@markup.link.url"] = {
      fg = M.base_30.purple,
    },

    ["@markup.raw"] = { fg = M.base_30.green },

    ["@markup.raw.delimiter"] = {
      fg = M.base_30.grey,
    },

    ["@markup.list"] = { fg = M.base_30.red },

    ["@markup.list.checked"] = {
      fg = M.base_30.purple,
    },

    ["@markup.list.unchecked"] = {
      fg = M.base_30.white,
    },

    -- Tags
    ["@tag"] = { fg = M.base_30.red },

    ["@tag.attribute"] = {
      fg = M.base_30.red,
    },

    ["@tag.delimiter"] = {
      fg = M.base_30.white,
    },
  },
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "decay")

return M
