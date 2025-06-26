local colors = require("themes").get_theme_tb("base_30")

return {
	NotifyBackground = { bg = colors.black },
	NotifyLogTime = { fg = colors.white, bg = colors.black },

	-- Borders
	NotifyINFOBorder = { fg = colors.blue, bg = colors.black },
	NotifyWARNBorder = { fg = colors.yellow, bg = colors.black },
	NotifyERRORBorder = { fg = colors.red, bg = colors.black },
	NotifyDEBUGBorder = { fg = colors.purple, bg = colors.black },
	NotifyTRACEBorder = { fg = colors.green, bg = colors.black },

	-- Icons
	NotifyERRORIcon = { fg = colors.red, bg = colors.black },
	NotifyWARNIcon = { fg = colors.yellow, bg = colors.black },
	NotifyINFOIcon = { fg = colors.blue, bg = colors.black },
	NotifyDEBUGIcon = { fg = colors.purple, bg = colors.black },
	NotifyTRACEIcon = { fg = colors.green, bg = colors.black },

	-- Titles
	NotifyERRORTitle = { fg = colors.red, bg = colors.black, bold = true },
	NotifyWARNTitle = { fg = colors.yellow, bg = colors.black, bold = true },
	NotifyINFOTitle = { fg = colors.blue, bg = colors.black, bold = true },
	NotifyDEBUGTitle = { fg = colors.purple, bg = colors.black, bold = true },
	NotifyTRACETitle = { fg = colors.green, bg = colors.black, bold = true },

	-- Bodies
	NotifyERRORBody = { fg = colors.red, bg = colors.black },
	NotifyWARNBody = { fg = colors.yellow, bg = colors.black },
	NotifyINFOBody = { fg = colors.blue, bg = colors.black },
	NotifyDEBUGBody = { fg = colors.purple, bg = colors.black },
	NotifyTRACEBody = { fg = colors.green, bg = colors.black },
}
