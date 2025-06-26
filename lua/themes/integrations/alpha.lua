local colors = require("themes").get_theme_tb("base_30")
local utils = require("themes.colors")

return {
	AlphaHeader = { fg = colors.blue },
	AlphaLabel = { fg = colors.yellow, bg = colors.black },
	AlphaIcon = { fg = colors.blue, bg = colors.black },
	AlphaKeyPrefix = { fg = colors.red, bg = utils.blend(colors.red, colors.black, 0.1) },
	AlphaMessage = { fg = colors.blue, bg = colors.black },
	AlphaFooter = { fg = colors.light_grey, bg = colors.black },
}
