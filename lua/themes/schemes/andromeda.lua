local M = {}

M.base_30 = {
  white = "#D5CED9",
  darker_black = "#1C1F27",
  black = "#23262E",
  black2 = "#2A2D35",
  one_bg = "#2E323C",
  one_bg2 = "#363B47",
  one_bg3 = "#3D4350",

  grey = "#5A6070",
  grey_fg = "#6B7182",
  grey_fg2 = "#7C8294",
  light_grey = "#8B92A8",

  red = "#FF657A",
  baby_pink = "#FF6E9A",
  pink = "#F92672",

  green = "#8AFF80",
  vibrant_green = "#A4FF8F",

  yellow = "#FFD866",
  sun = "#FFE792",

  blue = "#57C7FF",
  nord_blue = "#6CBFFF",

  cyan = "#9AEDFE",
  teal = "#5DE4C7",

  purple = "#C792EA",
  dark_purple = "#B084EB",

  orange = "#F89860",

  line = "#343A46",
  statusline_bg = "#262A33",
  lightbg = "#313642",

  pmenu_bg = "#57C7FF",
  folder_bg = "#57C7FF",
}

M.base_16 = {
  base00 = "#23262E",
  base01 = "#2E323C",
  base02 = "#363B47",
  base03 = "#5A6070",
  base04 = "#7C8294",
  base05 = "#D5CED9",
  base06 = "#E1D8E9",
  base07 = "#F8F8F2",

  base08 = "#FF657A",
  base09 = "#F89860",
  base0A = "#FFD866",
  base0B = "#8AFF80",
  base0C = "#9AEDFE",
  base0D = "#57C7FF",
  base0E = "#C792EA",
  base0F = "#FFB86C",
}

M.polish_hl = {
  treesitter = {
    -- Variables
    ["@variable"] = { fg = "#D5CED9" },
    ["@variable.parameter"] = { fg = "#FFB86C" },
    ["@variable.member"] = { fg = "#9AEDFE" },
    ["@variable.builtin"] = { fg = "#FF657A" },

    -- Constantes
    ["@constant"] = { fg = "#FFB86C" },
    ["@constant.builtin"] = { fg = "#FF657A" },
    ["@constant.macro"] = { fg = "#FF657A" },

    -- Strings
    ["@string"] = { fg = "#8AFF80" },
    ["@string.regex"] = { fg = "#5DE4C7" },
    ["@string.escape"] = { fg = "#FFD866" },
    ["@string.special"] = { fg = "#FFD866" },

    -- Números
    ["@number"] = { fg = "#F89860" },
    ["@number.float"] = { fg = "#F89860" },
    ["@boolean"] = { fg = "#F89860" },

    -- Tipos
    ["@type"] = { fg = "#FFD866" },
    ["@type.builtin"] = { fg = "#FFD866" },
    ["@type.definition"] = { fg = "#FFD866" },

    -- Clases y constructores
    ["@constructor"] = { fg = "#FFD866" },
    ["@attribute"] = { fg = "#FFD866" },
    ["@property"] = { fg = "#9AEDFE" },

    -- Funciones
    ["@function"] = { fg = "#57C7FF" },
    ["@function.call"] = { fg = "#57C7FF" },
    ["@function.method"] = { fg = "#57C7FF" },
    ["@function.method.call"] = { fg = "#57C7FF" },
    ["@function.builtin"] = { fg = "#FFD866" },
    ["@function.macro"] = { fg = "#57C7FF" },

    -- Keywords
    ["@keyword"] = { fg = "#C792EA", italic = true },
    ["@keyword.function"] = { fg = "#C792EA", italic = true },
    ["@keyword.return"] = { fg = "#C792EA", italic = true },
    ["@keyword.operator"] = { fg = "#C792EA" },
    ["@keyword.import"] = { fg = "#C792EA" },
    ["@keyword.repeat"] = { fg = "#C792EA" },
    ["@keyword.exception"] = { fg = "#C792EA" },
    ["@keyword.conditional"] = { fg = "#C792EA" },

    -- Operadores
    ["@operator"] = { fg = "#9AEDFE" },

    -- Módulos
    ["@module"] = { fg = "#FFD866" },
    ["@label"] = { fg = "#57C7FF" },

    -- Comentarios
    ["@comment"] = {
      fg = "#6B7182",
      italic = true,
    },

    ["@comment.todo"] = {
      fg = "#57C7FF",
      bold = true,
    },

    ["@comment.note"] = {
      fg = "#9AEDFE",
      bold = true,
    },

    ["@comment.warning"] = {
      fg = "#FFD866",
      bold = true,
    },

    ["@comment.error"] = {
      fg = "#FF657A",
      bold = true,
    },

    -- Tags HTML
    ["@tag"] = { fg = "#FF657A" },
    ["@tag.attribute"] = { fg = "#FFD866" },
    ["@tag.delimiter"] = { fg = "#D5CED9" },

    -- Markdown
    ["@markup.heading"] = {
      fg = "#57C7FF",
      bold = true,
    },

    ["@markup.link.url"] = {
      fg = "#5DE4C7",
      underline = true,
    },

    ["@markup.link.label"] = {
      fg = "#57C7FF",
    },

    -- Puntuación
    ["@punctuation.bracket"] = { fg = "#C792EA" },
    ["@punctuation.delimiter"] = { fg = "#D5CED9" },
    ["@punctuation.special"] = { fg = "#9AEDFE" },
  },
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "andromeda")

return M
