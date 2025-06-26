local colors = require("themes").get_theme_tb("base_30")
local blend = require("themes.colors").blend

local theme = {
	LualineNothing = { bg = colors.black2 },
	LualineNothing2 = { bg = colors.black2 },
	LualineSeparator = { bg = colors.black2 },
	LualineDiffAddIcon = { fg = colors.green, bg = colors.black2 },
	LualineDiffChangeIcon = { fg = colors.yellow, bg = colors.black2 },
	LualineDiffRemoveIcon = { fg = colors.red, bg = colors.black2 },
	LualineDiffAddText = { fg = colors.green, bg = colors.black2 },
	LualineDiffChangeText = { fg = colors.yellow, bg = colors.black2 },
	LualineDiffRemoveText = { fg = colors.red, bg = colors.black2 },
	LualineDiagnosticsErrorIcon = { fg = colors.red, bg = colors.black2 },
	LualineDiagnosticsWarnIcon = { fg = colors.yellow, bg = colors.black2 },
	LualineDiagnosticsInfoIcon = { fg = colors.blue, bg = colors.black2 },
	LualineDiagnosticsHintIcon = { fg = colors.teal, bg = colors.black2 },
	LualineDiagnosticsErrorText = { fg = colors.red, bg = colors.black2 },
	LualineDiagnosticsWarnText = { fg = colors.yellow, bg = colors.black2 },
	LualineDiagnosticsInfoText = { fg = colors.blue, bg = colors.black2 },
	LualineDiagnosticsHintText = { fg = colors.teal, bg = colors.black2 },

	-- Grupos activos
	LualineDotIcon = { bg = colors.blue, fg = colors.black },
	LualineFilenameIcon = { bg = colors.one_bg, fg = blend(colors.white, colors.black, 0.6) },
	LualineFilenameText = { bg = colors.one_bg, fg = blend(colors.white, colors.black, 0.6) },
	LualineFilenameSeparator = { bg = colors.black, fg = colors.one_bg },
	LualineDirIcon = { fg = colors.black, bg = colors.red },
	LualineDirText = { fg = colors.red, bg = blend(colors.red, colors.black, 0.1) },
	LualineDirSeparator = { bg = colors.black2, fg = colors.red },

	-- Lualine por modo
	LualineModeNormalIcon = { fg = colors.black, bg = colors.blue },
	LualineModeInsertIcon = { fg = colors.black, bg = colors.green },
	LualineModeVisualIcon = { fg = colors.black, bg = colors.purple },
	LualineModeReplaceIcon = { fg = colors.black, bg = colors.red },
	LualineModeCommandIcon = { fg = colors.black, bg = colors.yellow },
	LualineModeTerminalIcon = { fg = colors.black, bg = colors.teal },
	LualineModeSelectIcon = { fg = colors.black, bg = colors.dark_purple },

	LualineModeNormalText = { fg = colors.blue, bg = blend(colors.blue, colors.black, 0.1), bold = true },
	LualineModeInsertText = { fg = colors.green, bg = blend(colors.green, colors.black, 0.1), bold = true },
	LualineModeVisualText = { fg = colors.purple, bg = blend(colors.purple, colors.black, 0.1), bold = true },
	LualineModeReplaceText = { fg = colors.red, bg = blend(colors.red, colors.black, 0.1), bold = true },
	LualineModeCommandText = { fg = colors.yellow, bg = blend(colors.yellow, colors.black, 0.1), bold = true },
	LualineModeTerminalText = { fg = colors.teal, bg = blend(colors.teal, colors.black, 0.1), bold = true },
	LualineModeSelectText = { fg = colors.dark_purple, bg = blend(colors.dark_purple, colors.black, 0.1), bold = true },

	LualineModeNormalSeparator = { fg = colors.blue, bg = blend(colors.blue, colors.black, 0.1) },
	LualineModeInsertSeparator = { fg = colors.green, bg = blend(colors.green, colors.black, 0.1) },
	LualineModeVisualSeparator = { fg = colors.purple, bg = blend(colors.purple, colors.black, 0.1) },
	LualineModeReplaceSeparator = { fg = colors.red, bg = blend(colors.red, colors.black, 0.1) },
	LualineModeCommandSeparator = { fg = colors.yellow, bg = blend(colors.yellow, colors.black, 0.1) },
	LualineModeTerminalSeparator = { fg = colors.teal, bg = blend(colors.teal, colors.black, 0.1) },
	LualineModeSelectSeparator = { fg = colors.dark_purple, bg = blend(colors.dark_purple, colors.black, 0.1) },

	LualineModeNormalSeparator2 = { fg = blend(colors.blue, colors.black, 0.1), bg = colors.grey },
	LualineModeInsertSeparator2 = { fg = blend(colors.green, colors.black, 0.1), bg = colors.grey },
	LualineModeVisualSeparator2 = { fg = blend(colors.purple, colors.black, 0.1), bg = colors.grey },
	LualineModeReplaceSeparator2 = { fg = blend(colors.red, colors.black, 0.1), bg = colors.grey },
	LualineModeCommandSeparator2 = { fg = blend(colors.yellow, colors.black, 0.1), bg = colors.grey },
	LualineModeTerminalSeparator2 = { fg = blend(colors.teal, colors.black, 0.1), bg = colors.grey },
	LualineModeSelectSeparator2 = { fg = blend(colors.dark_purple, colors.black, 0.1), bg = colors.grey },

	LualineModeNormalSeparator3 = { fg = colors.grey, bg = colors.one_bg },
	LualineModeInsertSeparator3 = { fg = colors.grey, bg = colors.one_bg },
	LualineModeVisualSeparator3 = { fg = colors.grey, bg = colors.one_bg },
	LualineModeReplaceSeparator3 = { fg = colors.grey, bg = colors.one_bg },
	LualineModeCommandSeparator3 = { fg = colors.grey, bg = colors.one_bg },
	LualineModeTerminalSeparator3 = { fg = colors.grey, bg = colors.one_bg },
	LualineModeSelectSeparator3 = { fg = colors.grey, bg = colors.one_bg },

	LualineProgressIcon = { bg = colors.green, fg = colors.black },
	LualineProgressText = { bg = blend(colors.green, colors.black, 0.1), fg = colors.green },
	LualineProgressSeparator = { bg = colors.black2, fg = colors.green },
	LualineBranchIcon = { bg = colors.black, fg = blend(colors.white, colors.black, 0.6) },
	LualineBranchText = { bg = colors.black, fg = blend(colors.white, colors.black, 0.6) },
	LualineBranchSeparator = { bg = colors.black2, fg = colors.black },
	LualineLspIcon = { fg = colors.black, bg = colors.purple },
	LualineLspText = { fg = colors.purple, bg = blend(colors.purple, colors.black, 0.1) },
	LualineLspSeparator = { bg = colors.black2, fg = colors.purple },
	LualineVenvIcon = { fg = colors.black, bg = colors.yellow },
	LualineVenvText = { fg = colors.yellow, bg = blend(colors.yellow, colors.black, 0.1) },
	LualineVenvSeparator = { bg = colors.black2, fg = colors.yellow },

	-- Grupos inactivos
	LualineInactiveFilename = { bg = colors.one_bg, fg = colors.grey },
	LualineInactiveLocation = { bg = colors.one_bg, fg = colors.grey },

	-- Filetype
	LualineFiletypeIcon = { bg = colors.purple, fg = colors.black },
	LualineFiletypeText = { bg = colors.black, fg = colors.purple },
}

for _, section in ipairs({ "a", "b", "c", "x", "y", "z" }) do
	for _, mode in ipairs({ "normal", "insert", "visual", "command", "replace", "inactive", "terminal" }) do
		theme["lualine_" .. section .. "_" .. mode] = { bg = colors.black2, fg = colors.black2 }
	end
end

return theme
