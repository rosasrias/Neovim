local ok, DirectoryNode = pcall(require, "nvim-tree.node.directory")
if not ok then
	return
end

local folder_styles = {
	src = { hl = "NvimTreeFolderSrc", icon = "󰣞" },
	public = { hl = "NvimTreeFolderPublic", icon = "󰚝" },
	assets = { hl = "NvimTreeFolderAssets", icon = "󱁿" },
	static = { hl = "NvimTreeFolderAssets", icon = "󱁿" },
	components = { hl = "NvimTreeFolderComponents", icon = "󱂵" },
	hooks = { hl = "NvimTreeFolderHooks", icon = "󱧼" },
	context = { hl = "NvimTreeFolderContext", icon = "󱧮" },
	models = { hl = "NvimTreeFolderModels", icon = "󱞊" },
	services = { hl = "NvimTreeFolderServices", icon = "󰉌" },
	tests = { hl = "NvimTreeFolderTests", icon = "󰪺" },
	["__tests__"] = { hl = "NvimTreeFolderTests", icon = "󰪺" },
	config = { hl = "NvimTreeFolderConfig", icon = "" },
	configs = { hl = "NvimTreeFolderConfig", icon = "" },
	migrations = { hl = "NvimTreeFolderMigrations", icon = "󰾶" },
	docs = { hl = "NvimTreeFolderDocs", icon = "󱧶" },
	dist = { hl = "NvimTreeFolderDist", icon = "󱥾" },
	build = { hl = "NvimTreeFolderDist", icon = "󱥾" },
	lib = { hl = "NvimTreeFolderLib", icon = "󰴉" },
	vendor = { hl = "NvimTreeFolderVendor", icon = "󰉐" },
}

local function resolve_folder_style(name, fallback_hl, fallback_icon)
	local lname = name:lower()
	if folder_styles[lname] then
		return folder_styles[lname].hl, folder_styles[lname].icon
	end
	for key, style in pairs(folder_styles) do
		if lname:match(key) then
			return style.hl, style.icon
		end
	end
	return fallback_hl, fallback_icon
end

-- Patch name
local orig_name = DirectoryNode.highlighted_name
function DirectoryNode:highlighted_name()
	local res = orig_name(self)
	local hl, _ = resolve_folder_style(self.name, res.hl[1], nil)
	res.hl = { hl }
	return res
end

-- Patch icon
local orig_icon = DirectoryNode.highlighted_icon
function DirectoryNode:highlighted_icon()
	local res = orig_icon(self)
	local hl, icon = resolve_folder_style(self.name, res.hl[1], res.str)
	res.hl = { hl }
	res.str = icon
	return res
end
