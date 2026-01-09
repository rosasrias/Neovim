local ok, DirectoryNode = pcall(require, "nvim-tree.node.directory")
if not ok then
  return
end

local folder_icons = {
  default = "󰉋",
  source = "󰣞",
  frontend = "󱧴",
  styles = "󰉘",
  assets = "󰚝",
  config = "",
  build = "󰴋",
  docs = "󱧺",
  tests = "󱧸",
  deps = "󰢬",
  database = "󱋣",
  templates = "󱁿",
  storage = "󰉒",
  work = "",
}

local folder_icons_open = {
  default = "󰷏",
  source = "󰷎",
  frontend = "󱧵",
  styles = "󰮞",
  assets = "󰮟",
  config = "󱂀",
  build = "󰴌",
  docs = "󱧻",
  tests = "󱧹",
  deps = "󱃬",
  database = "󱋤",
  templates = "󱂀",
  storage = "󱃩",
  work = "󰮝",
}

local folder_families = {
  source = {
    icon_key = "source",
    icon = folder_icons.source,
    match = { "src", "app", "lib", "main", "java", "kotlin" },
  },

  frontend = {
    icon_key = "frontend",
    icon = folder_icons.frontend,
    match = { "components", "hooks", "context", "contexts", "pages" },
  },

  styles = {
    icon_key = "styles",
    icon = folder_icons.styles,
    match = { "styles", "css", "scss", "theme" },
  },

  assets = {
    icon_key = "assets",
    icon = folder_icons.assets,
    match = { "assets", "public", "static", "resources" },
  },

  config = {
    icon_key = "config",
    icon = folder_icons.config,
    match = { "config", "configs", "settings", ".husky" },
  },

  build = {
    icon_key = "build",
    icon = folder_icons.build,
    match = { "dist", "build", "target", "out" },
  },

  tests = {
    icon_key = "tests",
    icon = folder_icons.tests,
    match = { "tests", "__tests__", "spec", "test" },
  },

  deps = {
    icon_key = "deps",
    icon = folder_icons.deps,
    match = { "node_modules", "vendor", ".venv" },
  },

  database = {
    icon_key = "database",
    icon = folder_icons.database,
    match = { "database", "migrations" },
  },

  templates = {
    icon_key = "templates",
    icon = folder_icons.templates,
    match = { "templates" },
  },

  storage = {
    icon_key = "storage",
    icon = folder_icons.storage,
    match = { "storage", "cache" },
  },

  work = {
    icon_key = "work",
    icon = folder_icons.work,
    match = { "work", "portfolio" },
  },
}

local folder_highlights = {
  -- ===== Source / Core =====
  src = "NvimTreeFolderSrc",
  app = "NvimTreeFolderApp",
  lib = "NvimTreeFolderLib",
  main = "NvimTreeFolderMain",
  java = "NvimTreeFolderJava",
  kotlin = "NvimTreeFolderKotlin",

  -- ===== Frontend =====
  components = "NvimTreeFolderComponents",
  hooks = "NvimTreeFolderHooks",
  context = "NvimTreeFolderContext",
  contexts = "NvimTreeFolderContext",
  pages = "NvimTreeFolderPages",

  -- ===== Styles =====
  styles = "NvimTreeFolderStyles",
  css = "NvimTreeFolderStyles",
  scss = "NvimTreeFolderStyles",
  theme = "NvimTreeFolderStyles",

  -- ===== Assets =====
  assets = "NvimTreeFolderAssets",
  public = "NvimTreeFolderPublic",
  static = "NvimTreeFolderAssets",
  resources = "NvimTreeFolderResources",

  -- ===== Config / Tooling =====
  config = "NvimTreeFolderConfig",
  configs = "NvimTreeFolderConfig",
  settings = "NvimTreeFolderConfig",
  [".husky"] = "NvimTreeFolderHusky",

  -- ===== Build =====
  build = "NvimTreeFolderBuild",
  dist = "NvimTreeFolderDist",
  target = "NvimTreeFolderBuild",
  out = "NvimTreeFolderBuild",

  -- ===== Tests =====
  tests = "NvimTreeFolderTests",
  test = "NvimTreeFolderTests",
  spec = "NvimTreeFolderTests",
  __tests__ = "NvimTreeFolderTests",

  -- ===== Dependencies =====
  node_modules = "NvimTreeFolderDeps",
  vendor = "NvimTreeFolderVendor",
  [".venv"] = "NvimTreeFolderDeps",

  -- ===== Database =====
  database = "NvimTreeFolderDatabase",
  migrations = "NvimTreeFolderMigrations",

  -- ===== Templates =====
  templates = "NvimTreeFolderTemplates",

  -- ===== Storage =====
  storage = "NvimTreeFolderStorage",
  cache = "NvimTreeFolderStorage",

  -- ===== Work =====
  work = "NvimTreeFolderWork",
  portfolio = "NvimTreeFolderWork",

  -- ===== Docs / Content =====
  docs = "NvimTreeFolderDocs",
  guide = "NvimTreeFolderDocs",
  content = "NvimTreeFolderContent",
  posts = "NvimTreeFolderContent",
  articles = "NvimTreeFolderContent",
}

-- Patch folder name highlighting
local orig_name = DirectoryNode.highlighted_name
function DirectoryNode:highlighted_name()
  local res = orig_name(self)

  local custom_hl = folder_highlights[self.name:lower()]
  if custom_hl then
    res.hl = { custom_hl }
  end

  return res
end

-- Patch folder icon rendering
local orig_icon = DirectoryNode.highlighted_icon

function DirectoryNode:highlighted_icon()
  local res = orig_icon(self)
  local name = self.name:lower()

  -- buscar familia
  local family
  for _, fam in pairs(folder_families) do
    for _, pat in ipairs(fam.match) do
      if name == pat then
        family = fam
        break
      end
    end
  end

  -- sin categoría → default nvim-tree
  if not family then
    return res
  end

  -- resolver HL (MISMO que el name)
  local hl = folder_highlights[name]
  if hl then
    res.hl = { hl }
  end

  -- carpeta vacía → filled
  if not self.nodes or #self.nodes == 0 then
    res.str = family.icon
    return res
  end

  -- abierta → outline
  if self.open then
    res.str = folder_icons_open[family.icon_key] or family.icon
    return res
  end

  -- cerrada → filled
  res.str = family.icon
  return res
end
