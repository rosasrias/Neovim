local ok, DirectoryNode = pcall(require, "nvim-tree.node.directory")
if not ok then
  return
end

local folder_categories = {
  source = {
    match = { "^src$", "^app$", "^main$", "^lib$", "^include$", "^java$", "^kotlin$" },
    hl = "NvimTreeFolderSrc",
    icon = "󱂵",
    priority = 100,
  },
  tests = {
    match = { "tests?", "__tests__", "spec", "test" },
    hl = "NvimTreeFolderTests",
    icon = "󰴋",
    priority = 90,
  },
  docs = {
    match = { "docs", "guide", "readme" },
    hl = "NvimTreeFolderDocs",
    icon = "󱧶",
    priority = 80,
  },
  config = {
    match = { "config", "configs", "settings", "^%.config$" },
    hl = "NvimTreeFolderConfig",
    icon = "󱁿",
    priority = 80,
  },
  build = {
    match = { "dist", "build", "target", "out", "bin" },
    hl = "NvimTreeFolderBuild",
    icon = "󱧼", -- nf-md-folder_wrench
    priority = 70,
  },
  vendor = {
    match = { "vendor", "node_modules", "%.venv" },
    hl = "NvimTreeFolderDeps",
    icon = "󰉙", -- nf-md-folder_library
    priority = 70,
  },

  -- React / Next.js
  components = { match = { "components" }, hl = "NvimTreeFolderComponents", icon = "󰉎", priority = 90 },
  hooks = { match = { "hooks" }, hl = "NvimTreeFolderHooks", icon = "󰣞", priority = 90 },
  context = { match = { "context", "contexts" }, hl = "NvimTreeFolderContext", icon = "󰉗", priority = 80 },
  pages = { match = { "pages" }, hl = "NvimTreeFolderPages", icon = "󰉘", priority = 80 },
  layouts = { match = { "layouts" }, hl = "NvimTreeFolderLayouts", icon = "󰉙", priority = 70 },
  styles = { match = { "styles", "css", "scss", "theme" }, hl = "NvimTreeFolderStyles", icon = "󰴉", priority = 70 },
  public = { match = { "public", "static", "assets" }, hl = "NvimTreeFolderAssets", icon = "󱍙", priority = 60 },

  -- Vue
  composables = { match = { "composables" }, hl = "NvimTreeFolderHooks", icon = "󰚝", priority = 80 },
  store = { match = { "store", "pinia", "vuex" }, hl = "NvimTreeFolderStore", icon = "󱂵", priority = 80 },
  views = { match = { "views" }, hl = "NvimTreeFolderPages", icon = "󱞊", priority = 70 },

  -- Angular
  modules = { match = { "modules" }, hl = "NvimTreeFolderModules", icon = "󰉝", priority = 90 },
  services = { match = { "services" }, hl = "NvimTreeFolderServices", icon = "󰣞", priority = 80 },
  pipes = { match = { "pipes" }, hl = "NvimTreeFolderPipes", icon = "󱁽", priority = 70 },
  guards = { match = { "guards" }, hl = "NvimTreeFolderGuards", icon = "󱋣", priority = 70 },
  environments = { match = { "environments" }, hl = "NvimTreeFolderConfig", icon = "", priority = 60 },

  -- Django
  apps = { match = { "apps" }, hl = "NvimTreeFolderApps", icon = "󰉌", priority = 80 },
  templates = { match = { "templates" }, hl = "NvimTreeFolderTemplates", icon = "󱃪", priority = 70 },
  migrations = { match = { "migrations" }, hl = "NvimTreeFolderMigrations", icon = "󰉒", priority = 70 },
  static = { match = { "static", "media" }, hl = "NvimTreeFolderAssets", icon = "󱍙", priority = 60 },

  -- Node.js / Express
  routes = { match = { "routes", "api" }, hl = "NvimTreeFolderRoutes", icon = "󰉓", priority = 80 },
  controllers = { match = { "controllers" }, hl = "NvimTreeFolderControllers", icon = "󰴋", priority = 80 },
  middlewares = { match = { "middlewares" }, hl = "NvimTreeFolderMiddlewares", icon = "󰾶", priority = 70 },
  models = { match = { "models" }, hl = "NvimTreeFolderModels", icon = "󰉌", priority = 70 },
  scripts = { match = { "scripts" }, hl = "NvimTreeFolderScripts", icon = "󱧬", priority = 60 },

  -- C / C++
  include = { match = { "include" }, hl = "NvimTreeFolderInclude", icon = "󰉗", priority = 90 },
  cmake = { match = { "cmake" }, hl = "NvimTreeFolderBuild", icon = "󰉐", priority = 80 },
  make = { match = { "makefiles" }, hl = "NvimTreeFolderBuild", icon = "󰉐", priority = 80 },

  -- Infra
  docker = { match = { "docker", "^%.docker$" }, hl = "NvimTreeFolderDocker", icon = "󰡨", priority = 70 },
  k8s = { match = { "k8s", "kubernetes" }, hl = "NvimTreeFolderK8s", icon = "󱃾", priority = 70 },
  helm = { match = { "helm" }, hl = "NvimTreeFolderHelm", icon = "󰡧", priority = 70 },
  ci = {
    match = { "^%.github$", "^%.gitlab%-ci$", "ci", "workflows?" },
    hl = "NvimTreeFolderCI",
    icon = "󰘬",
    priority = 70,
  },
}

local function resolve_folder_style(name, fallback_hl, fallback_icon)
  local lname = name:lower()
  local best = { priority = -1 }

  for _, cat in pairs(folder_categories) do
    for _, pat in ipairs(cat.match) do
      if lname:match(pat) and (not best.priority or cat.priority > best.priority) then
        best = cat
      end
    end
  end

  if best.hl then
    return best.hl, best.icon
  end

  return fallback_hl or "NvimTreeFolderIcon", fallback_icon or ""
end

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
