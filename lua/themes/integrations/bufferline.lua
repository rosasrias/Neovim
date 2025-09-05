local colors = require("themes").get_theme_tb("base_30")
local blend = require("themes.colors").blend
local devicons = require("nvim-web-devicons")

local function sanitize(name)
	name = tostring(name)
	return name:gsub("[^%w_]", "_")
end

local function generate_icon_colors()
	local icons = {}

	for _, icon_data in pairs(devicons.get_icons()) do
		local name = sanitize(icon_data.name or "Default")
		local hl_name = "BufferLineDevIcon" .. name

		-- Normal: color original del icono, fondo negro
		icons[hl_name] = {
			fg = icon_data.color or colors.white,
			bg = colors.black,
		}

		-- Selected: todos uniformes
		icons[hl_name .. "Selected"] = {
			fg = colors.black,
			bg = colors.blue,
		}
	end

	return icons
end

local icon_styles = generate_icon_colors()

return vim.tbl_extend("force", {
	BufferlineRun = { fg = colors.teal, bg = blend(colors.teal, colors.black, 0.15) },
	BufferlineSplit = { fg = colors.green, bg = blend(colors.green, colors.black, 0.15) },
	BufferlineTheme = { fg = colors.yellow, bg = blend(colors.yellow, colors.black, 0.15) },
	BUfferlineTrasparency = { fg = colors.blue, bg = blend(colors.blue, colors.black, 0.15) },
	BufferlineCloseAll = { fg = colors.red, bg = blend(colors.red, colors.black, 0.15) },

	BufferLineBackground = { fg = colors.light_grey, bg = colors.black },
	BufferLineBuffer = { fg = colors.grey, bg = colors.black },
	BufferLineBufferSelected = { fg = colors.black, bg = colors.blue, bold = true },
	BufferLineBufferVisible = { fg = colors.blue, bg = colors.black },
	BufferLineCloseButton = { fg = colors.red, bg = colors.black },
	BufferLineCloseButtonSelected = { fg = colors.black, bg = colors.blue },
	BufferLineCloseButtonVisible = { fg = colors.red, bg = colors.black },
	BufferLineDuplicate = { fg = colors.dark_purple, bg = colors.black },
	BufferLineDuplicateSelected = { fg = colors.dark_purple, bg = colors.black },
	BufferLineDuplicateVisible = { fg = colors.dark_purple, bg = colors.black },
	BufferLineFill = { fg = colors.grey, bg = colors.black },
	BufferLineIndicatorSelected = { fg = colors.blue, bg = colors.blue },
	BufferLineIndicatorVisible = { fg = colors.black, bg = colors.black },
	BufferLineModified = { fg = colors.green, bg = colors.black },
	BufferLineModifiedSelected = { fg = colors.black, bg = colors.blue },
	BufferLineModifiedVisible = { fg = colors.green, bg = colors.black },
	BufferLineOffsetSeparator = { fg = colors.blue, bg = colors.blue },
	BufferLinePick = { fg = colors.sun, bg = colors.black, bold = true },
	BufferLinePickSelected = { fg = colors.light_grey, bg = colors.blue, bold = true },
	BufferLinePickVisible = { fg = colors.light_grey, bg = colors.black, bold = true },
	BufferLineSeparator = { fg = colors.black, bg = colors.black },
	BufferLineSeparatorSelected = { fg = colors.blue, bg = colors.blue },
	BufferLineSeparatorVisible = { fg = colors.black, bg = colors.black },
	BufferLineTabClose = { fg = colors.red, bg = colors.black },
	BufferLineTab = { fg = colors.grey, bg = colors.black },
	BufferLineTabSelected = { fg = colors.blue, bg = colors.black, bold = true },
	BufferLineTabSeparator = { fg = colors.black, bg = colors.black },
	BufferLineTabSeparatorSelected = { fg = colors.black, bg = colors.black },
}, icon_styles)
