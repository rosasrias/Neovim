local colors = require("themes").get_theme_tb("base_30")
local theme_type = require("themes").get_theme_tb("theme_type")
local tune_color = require("themes.colors").change_hex_lightness

return {
	NvimTreeEmptyFolderName = { fg = colors.folder_bg },
	NvimTreeEndOfBuffer = { fg = colors.darker_black },
	NvimTreeFolderIcon = { fg = colors.folder_bg },
	NvimTreeFolderName = { fg = colors.folder_bg },
	NvimTreeFolderArrowOpen = { fg = colors.folder_bg },
	NvimTreeFolderArrowClosed = { fg = colors.grey_fg },
	NvimTreeGitDirty = { fg = colors.red },
	NvimTreeIndentMarker = { fg = (theme_type == "dark" and tune_color(colors.line, -2) or colors.one_bg2) },
	NvimTreeNormal = { bg = colors.darker_black },
	NvimTreeNormalNC = { bg = colors.darker_black },
	NvimTreeOpenedFolderName = { fg = colors.folder_bg },
	NvimTreeGitIgnored = { fg = colors.light_grey },
	NvimTreeDiagnosticErrorFileHL = { link = "DiagnosticError" },
	NvimTreeDiagnosticErrorFolderHL = { link = "DiagnosticError" },
	NvimTreeDiagnosticInfoFileHL = { link = "DiagnosticNormal" },
	NvimTreeDiagnosticInfoFolderHL = { link = "DiagnosticNormal" },
	NvimTreeDiagnosticWarnFileHL = { link = "DiagnosticWarn" },
	NvimTreeDiagnosticWarnFolderHL = { link = "DiagnosticWarn" },
	NvimTreeDiagnosticHintFileHL = { link = "DiagnosticHint" },
	NvimTreeDiagnosticHintFolderHL = { link = "DiagnosticHint" },

	NvimTreeWinSeparator = {
		fg = colors.darker_black,
		bg = colors.darker_black,
	},

	NvimTreeWindowPicker = {
		fg = colors.red,
		bg = colors.black2,
	},

	NvimTreeCursorLine = {
		bg = colors.black,
	},

	NvimTreeGitNew = {
		fg = colors.yellow,
	},

	NvimTreeGitDeleted = {
		fg = colors.red,
	},

	NvimTreeSpecialFile = {
		fg = colors.yellow,
		bold = true,
	},

	NvimTreeRootFolder = {
		fg = colors.red,
		bold = true,
	},

	NvimTreeFolderSrc = { fg = colors.purple },
	NvimTreeFolderPublic = { fg = colors.green },
	NvimTreeFolderAssets = { fg = colors.cyan },
	NvimTreeFolderComponents = { fg = colors.yellow },
	NvimTreeFolderHooks = { fg = colors.teal },
	NvimTreeFolderContext = { fg = colors.orange },
	NvimTreeFolderModels = { fg = colors.purple },
	NvimTreeFolderServices = { fg = colors.red },
	NvimTreeFolderTests = { fg = colors.red },
	NvimTreeFolderConfig = { fg = colors.purple },
	NvimTreeFolderMigrations = { fg = colors.pink },
	NvimTreeFolderDocs = { fg = colors.yellow },
	NvimTreeFolderDist = { fg = colors.grey_fg },
	NvimTreeFolderLib = { fg = colors.cyan },
	NvimTreeFolderVendor = { fg = colors.orange },
	NvimTreeFolderMain = { fg = colors.baby_pink },
	NvimTreeFolderJava = { fg = colors.red },
	NvimTreeFolderResources = { fg = colors.teal },
	NvimTreeFolderBuild = { fg = colors.green },

	-- Nuevos (Astro / Next / Content-driven)
	NvimTreeFolderPages = { fg = colors.blue }, -- secciones de la app
	NvimTreeFolderStyles = { fg = colors.cyan }, -- CSS, SCSS, themes
	NvimTreeFolderContent = { fg = colors.red }, -- markdown, posts, artículos
}
