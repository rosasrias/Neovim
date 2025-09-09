-- Try to require the DirectoryNode module safely
local ok, DirectoryNode = pcall(require, "nvim-tree.node.directory")
if not ok then
	return
end

-- ============================================================
-- Universal folder categories (covers most frameworks/stacks)
-- ============================================================

local folder_categories = {
	-- Source code
	source = {
		match = { "src", "app", "main", "java", "kotlin", "lib" },
		hl = "NvimTreeFolderSrc",
		icon = "󰣞", -- folder default
	},

	-- Frontend / React ecosystem
	components = {
		match = { "components" },
		hl = "NvimTreeFolderComponents",
		icon = "󱧴", -- folder block
	},
	hooks = {
		match = { "hooks" },
		hl = "NvimTreeFolderHooks",
		icon = "󱧼", -- folder curve
	},
	context = {
		match = { "context", "contexts" },
		hl = "NvimTreeFolderContext",
		icon = "󱧊", -- folder connections
	},
	models = {
		match = { "models" },
		hl = "NvimTreeFolderModels",
		icon = "󰉌", -- folder archive
	},
	services = {
		match = { "services" },
		hl = "NvimTreeFolderServices",
		icon = "󱂵", -- folder gear-ish
	},
	pages = {
		match = { "pages" },
		hl = "NvimTreeFolderPages",
		icon = "󱧼", -- folder with doc
	},
	styles = {
		match = { "styles", "css", "scss", "theme" },
		hl = "NvimTreeFolderStyles",
		icon = "󰉘", -- folder palette
	},
	content = {
		match = { "content", "posts", "articles" },
		hl = "NvimTreeFolderContent",
		icon = "󱃪", -- folder text
	},
	work = {
		match = { "work", "portfolio" },
		hl = "NvimTreeFolderWork",
		icon = "", -- folder briefcase
	},

	-- Tests
	tests = {
		match = { "tests", "__tests__", "spec", "test" },
		hl = "NvimTreeFolderTests",
		icon = "󱧸", -- folder lab/test
	},

	-- Configuration
	config = {
		match = { "config", "configs", "settings" },
		hl = "NvimTreeFolderConfig",
		icon = "", -- folder cog
	},

	-- Build / Output
	build = {
		match = { "dist", "build", "target", "out" },
		hl = "NvimTreeFolderBuild",
		icon = "󰴋", -- folder build
	},

	-- Documentation
	docs = {
		match = { "docs", "guide" },
		hl = "NvimTreeFolderDocs",
		icon = "󱧺", -- folder book
	},

	-- Assets / Resources
	assets = {
		match = { "assets", "public", "static", "resources" },
		hl = "NvimTreeFolderAssets",
		icon = "󰚝", -- folder images
	},

	-- Dependencies
	deps = {
		match = { "vendor", "node_modules", ".venv" },
		hl = "NvimTreeFolderDeps",
		icon = "󰢬", -- folder cube
	},

	-- Databases / Migrations
	db = {
		match = { "migrations", "database" },
		hl = "NvimTreeFolderDatabase",
		icon = "󱋣", -- folder database
	},

	-- Templates (Django, etc.)
	templates = {
		match = { "templates" },
		hl = "NvimTreeFolderTemplates",
		icon = "󱁿", -- folder layout
	},

	-- Storage / Cache
	storage = {
		match = { "storage", "cache" },
		hl = "NvimTreeFolderStorage",
		icon = "󰉒", -- folder download
	},
}
-- ============================================================
-- Style resolver
-- ============================================================
local function resolve_folder_style(name, fallback_hl, fallback_icon)
	local lname = name:lower()

	-- Go through categories and check matches
	for _, cat in pairs(folder_categories) do
		for _, pat in ipairs(cat.match) do
			if lname == pat or lname:find(pat, 1, true) then
				return cat.hl, cat.icon
			end
		end
	end

	-- Fallback safe defaults
	return fallback_hl or "NvimTreeFolderIcon", fallback_icon or ""
end

-- ============================================================
-- Patch nvim-tree DirectoryNode methods
-- ============================================================

-- Patch folder name highlighting
local orig_name = DirectoryNode.highlighted_name
function DirectoryNode:highlighted_name()
	local res = orig_name(self)
	local hl, _ = resolve_folder_style(self.name, res.hl[1], nil)
	res.hl = { hl }
	return res
end

-- Patch folder icon rendering
local orig_icon = DirectoryNode.highlighted_icon
function DirectoryNode:highlighted_icon()
	local res = orig_icon(self)
	local hl, icon = resolve_folder_style(self.name, res.hl[1], res.str)
	res.hl = { hl }
	res.str = icon
	return res
end
