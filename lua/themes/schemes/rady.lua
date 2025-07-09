-- Theme: Rady
-- Based on rice by https://github.com/rxyhn
-- Adaptado con colores personalizados por @alex

local M = {}

M.base_30 = {
	white = "#dee1e6",
	darker_black = "#13171b",
	black = "#171B20", -- nvim bg
	black2 = "#1a1e24",
	one_bg = "#1a1e24",
	one_bg2 = "#21262e",
	one_bg3 = "#242931",
	grey = "#485263",
	grey_fg = "#4f596b",
	grey_fg2 = "#5a6677",
	light_grey = "#6b7380",
	red = "#e05f65",
	baby_pink = "#e26a70",
	pink = "#e05f65",
	line = "#1a1e24", -- for lines like vertsplit
	green = "#94F7C5",
	vibrant_green = "#a1f9cc",
	nord_blue = "#70a5eb",
	blue = "#70a5eb",
	yellow = "#f1cf8a",
	sun = "#f9d996",
	purple = "#c68aee",
	dark_purple = "#b07cdb",
	teal = "#74bee9",
	orange = "#e9967e",
	cyan = "#74bee9",
	statusline_bg = "#171B20",
	lightbg = "#21262e",
	pmenu_bg = "#94F7C5",
	folder_bg = "#70a5eb",
}

M.base_16 = {
	base00 = "#171B20",
	base01 = "#1a1e24",
	base02 = "#21262e",
	base03 = "#242931",
	base04 = "#485263",
	base05 = "#b6beca",
	base06 = "#dee1e6",
	base07 = "#e6e9ef",
	base08 = "#e05f65", -- red
	base09 = "#f1cf8a", -- yellow
	base0A = "#e9967e", -- orange-ish
	base0B = "#94F7C5", -- green
	base0C = "#74bee9", -- cyan
	base0D = "#70a5eb", -- blue
	base0E = "#c68aee", -- magenta
	base0F = "#e05f65", -- pink
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "rady")

return M
