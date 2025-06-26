return {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			icons_enabled = false,
			globalstatus = true,
			component_separators = "",
			section_separators = "",
			refresh = { statusline = 100 },
		},
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function()
						local mode_map = {
							n = "NORMAL",
							i = "INSERT",
							v = "VISUAL",
							V = "V-LINE",
							["␖"] = "V-BLOCK",
							t = "TERMINAL",
							c = "COMMAND",
							R = "REPLACE",
							s = "SELECT",
							S = "S-LINE",
							["␓"] = "S-BLOCK",
						}

						local current_mode = vim.fn.mode()
						local mode_name = mode_map[current_mode] or current_mode:upper()

						local highlight_mode = ({
							n = "Normal",
							i = "Insert",
							v = "Visual",
							V = "Visual",
							["␖"] = "Visual",
							t = "Terminal",
							c = "Command",
							R = "Replace",
							s = "Select",
							S = "Select",
							["␓"] = "Select",
						})[current_mode] or "Normal"

						return string.format(
							"%%#LualineMode%sIcon# %%#LualineMode%sSeparator# %%#LualineMode%sText#%s %%#LualineMode%sSeparator2# %%#LualineMode%sSeparator3#",
							highlight_mode,
							highlight_mode,
							highlight_mode,
							mode_name,
							highlight_mode,
							highlight_mode
						)
					end,
				},
				{
					"filename",
					fmt = function(filename)
						local icon = require("nvim-web-devicons").get_icon(filename) or "󰈙"
						local name = vim.fn.fnamemodify(filename, ":t")
						return string.format(
							"%%#LualineFilenameIcon#%s %%#LualineFilenameText#%s %%#LualineFilenameSeparator#%s",
							icon,
							name,
							""
						)
					end,
				},
			},
			lualine_b = {},
			lualine_c = {
				{
					"branch",
					fmt = function(branch)
						if not branch or branch == "NaN" then
							return ""
						end
						return string.format(
							"%%#LualineBranchIcon#%s %%#LualineBranchText#%s %%#LualineBranchSeparator#%s",
							"",
							branch,
							""
						)
					end,
				},
				{
					"diff",
					fmt = function()
						local status = vim.b.gitsigns_status_dict
						if not status then
							return ""
						end

						local components = {
							{ status.added or 0, "", "LualineDiffAddIcon", "LualineDiffAddText" },
							{ status.changed or 0, "", "LualineDiffChangeIcon", "LualineDiffChangeText" },
							{ status.removed or 0, "", "LualineDiffRemoveIcon", "LualineDiffRemoveText" },
						}

						local result = {}
						for _, item in ipairs(components) do
							if item[1] > 0 then
								table.insert(
									result,
									string.format("%%#%s#%s %%#%s#%d", item[3], item[2], item[4], item[1])
								)
							end
						end

						return table.concat(result, " ")
					end,
				},
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					fmt = function()
						local severities = {
							{
								vim.diagnostic.severity.ERROR,
								"",
								"LualineDiagnosticsErrorIcon",
								"LualineDiagnosticsErrorText",
							},
							{
								vim.diagnostic.severity.WARN,
								"󱒼",
								"LualineDiagnosticsWarnIcon",
								"LualineDiagnosticsWarnText",
							},
							{
								vim.diagnostic.severity.HINT,
								"󰌵",
								"LualineDiagnosticsHintIcon",
								"LualineDiagnosticsHintText",
							},
							{
								vim.diagnostic.severity.INFO,
								"",
								"LualineDiagnosticsInfoIcon",
								"LualineDiagnosticsInfoText",
							},
						}

						local result = {}
						for _, s in ipairs(severities) do
							local count = #vim.diagnostic.get(0, { severity = s[1] })
							if count > 0 then
								table.insert(result, string.format("%%#%s#%s %%#%s#%d", s[3], s[2], s[4], count))
							end
						end

						return table.concat(result, " ")
					end,
				},
				{
					"lsp",
					fmt = function()
						local buf = vim.api.nvim_get_current_buf()
						for _, client in ipairs(vim.lsp.get_clients({ bufnr = buf })) do
							if client.attached_buffers[buf] then
								return string.format(
									"%%#LualineLspSeparator#%s%%#LualineLspIcon#%s %%#LualineLspText# %s",
									"",
									" ",
									client.name
								)
							end
						end
						return ""
					end,
				},
				{
					"venv",
					fmt = function()
						local venv = vim.env.VIRTUAL_ENV
						if not venv then
							return ""
						end

						local venv_name = vim.fn.fnamemodify(venv, ":t") .. " "
						return string.format(
							"%%#LualineVenvSeparator#%s%%#LualineVenvIcon#%s %%#LualineVenvText# %s",
							"",
							" ",
							venv_name
						)
					end,
				},
			},
			lualine_y = {
				{
					"directory",
					fmt = function()
						return string.format(
							"%%#LualineDirSeparator#%s%%#LualineDirIcon#%s %%#LualineDirText# %s",
							"",
							" ",
							vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						)
					end,
				},
				{
					"progress",
					fmt = function()
						local chars = { " ", "󰪞 ", "󰪟 ", "󰪠 ", "󰪢 ", "󰪣 ", "󰪤 ", "󰪥 " }
						local current = vim.fn.line(".")
						local total = math.max(1, vim.fn.line("$"))
						local index = math.floor((current / total) * (#chars - 1)) + 1
						index = math.max(1, math.min(index, #chars))

						return string.format(
							"%%#LualineProgressSeparator#%s%%#LualineProgressIcon#%s %%#LualineProgressText# %s",
							"",
							chars[index],
							math.floor((current / total) * 100) .. "%% "
						)
					end,
				},
			},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_c = {
				{ "filename", hl = "LualineInactiveFilename" },
			},
			lualine_x = {
				{ "location", hl = "LualineInactiveLocation" },
			},
		},
	},
}
