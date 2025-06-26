local M = {}
local api = vim.api
local cmp_ui = {
	format_colors = { lsp = true, icon = "󱓻" },
}
local icon = cmp_ui.format_colors.icon .. " "

local hlcache = {}

M.lsp = function(entry, item, kind_txt)
	local color = entry.completion_item.documentation

	if color and type(color) == "string" and color:match("^#%x%x%x%x%x%x$") then
		local hl = "hex-" .. color:sub(2)

		if not hlcache[hl] then
			api.nvim_set_hl(0, hl, { fg = color })
			hlcache[hl] = true
		end

		item.kind = (icon or (" " .. icon)) .. kind_txt
		item.kind_hl_group = hl
		item.menu_hl_group = hl
	end
end

return M
