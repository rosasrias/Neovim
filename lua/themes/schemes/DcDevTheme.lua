-- DcDevTheme: un tema oscuro en tonos rojos para Neovim
-- Inspirado en un esquema monocromático (rojo + negro)

local M = {}

M.base_30 = {
	white = "#ffffff",
	darker_black = "#0a0a0a",
	black = "#000000", -- nvim bg
	black2 = "#111111",
	one_bg = "#1a0b0b",
	one_bg2 = "#220c0c",
	one_bg3 = "#2a0e0e",
	grey = "#3d1a1a",
	grey_fg = "#502020",
	grey_fg2 = "#632626",
	light_grey = "#7a2d2d",
	red = "#ff0000", -- rojo principal
	baby_pink = "#ff4d4d", -- rojo claro
	pink = "#ff8080", -- rojo pálido
	line = "#2e0e0e", -- líneas como vertsplit
	green = "#a33636", -- rojo oscuro tirando a marrón
	vibrant_green = "#c23c3c", -- rojo encendido
	nord_blue = "#9d3030", -- rojo apagado
	blue = "#b23131", -- rojo más claro
	yellow = "#d94d4d", -- rojo-anaranjado
	sun = "#ff5d5d",
	purple = "#ff7070", -- rojo con matiz púrpura
	dark_purple = "#802020",
	teal = "#a33a3a",
	orange = "#e24e4e",
	cyan = "#bb3333",
	statusline_bg = "#111111",
	lightbg = "#1a0b0b",
	pmenu_bg = "#ff0000",
	folder_bg = "#ff0000",
}

M.base_16 = {
	base00 = "#000000", -- bg
	base01 = "#111111",
	base02 = "#1a0b0b",
	base03 = "#2a0e0e",
	base04 = "#3d1a1a",
	base05 = "#e5e5e5", -- texto principal
	base06 = "#f2f2f2",
	base07 = "#ffffff", -- blanco
	base08 = "#ff0000", -- rojo vivo
	base09 = "#ff4d4d", -- rojo suave
	base0A = "#ff8080", -- rojo pálido
	base0B = "#a33636", -- rojo profundo
	base0C = "#c23c3c", -- rojo encendido
	base0D = "#b23131", -- rojo cálido
	base0E = "#ff5d5d", -- rojo brillante
	base0F = "#802020", -- rojo oscuro
}

M.theme_type = "dark"

M.polish_hl = {
	treesitter = {
		["@tag"] = { fg = M.base_30.red },
		["@tag.delimiter"] = { fg = M.base_30.pink },
		["@string"] = { fg = M.base_30.baby_pink },
		["@function"] = { fg = M.base_30.red, bold = true },
	},
	telescope = {
		TelescopeSelection = { bg = M.base_30.one_bg, fg = M.base_30.red },
		TelescopeBorder = { fg = M.base_30.red },
	},
	git = {
		GitSignsAdd = { fg = M.base_30.sun },
		GitSignsChange = { fg = M.base_30.orange },
		GitSignsDelete = { fg = M.base_30.red },
	},
}

M = require("themes").override_theme(M, "DcDevTheme")

return M
