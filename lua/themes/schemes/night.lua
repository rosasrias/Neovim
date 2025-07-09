-- Theme: Night
-- Adaptado de una paleta personalizada por @alex

local M = {}

M.base_30 = {
	white = "#d9d7d6",
	darker_black = "#040f13",
	black = "#061115", -- nvim bg
	black2 = "#0b161a",
	one_bg = "#0b161a",
	one_bg2 = "#101b1f",
	one_bg3 = "#1c252c",
	grey = "#484e5b",
	grey_fg = "#555b68",
	grey_fg2 = "#606672",
	light_grey = "#6a707b",
	red = "#df5b61",
	baby_pink = "#f16269",
	pink = "#f16269",
	line = "#0b161a", -- for lines like vertsplit
	green = "#78b892",
	vibrant_green = "#8cd7aa",
	nord_blue = "#6791c9",
	blue = "#6791c9",
	yellow = "#de8f78",
	sun = "#e9967e",
	purple = "#c488ec",
	dark_purple = "#bc83e3",
	teal = "#7acfe4",
	orange = "#e9967e",
	cyan = "#67afc1",
	statusline_bg = "#061115",
	lightbg = "#101b1f",
	pmenu_bg = "#78b892",
	folder_bg = "#6791c9",
}

M.base_16 = {
	base00 = "#061115", -- background
	base01 = "#0b161a",
	base02 = "#101b1f",
	base03 = "#1c252c",
	base04 = "#484e5b",
	base05 = "#d9d7d6", -- foreground
	base06 = "#e5e5e5",
	base07 = "#f0f0f0",
	base08 = "#df5b61", -- red
	base09 = "#de8f78", -- yellowish
	base0A = "#e9967e", -- orange-like
	base0B = "#78b892", -- green
	base0C = "#67afc1", -- cyan
	base0D = "#6791c9", -- blue
	base0E = "#c488ec", -- magenta
	base0F = "#f16269", -- pink
}

M.theme_type = "dark"

M = require("themes").override_theme(M, "night")

return M
