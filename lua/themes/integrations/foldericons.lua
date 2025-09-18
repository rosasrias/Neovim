local colors = require("themes").get_theme_tb "base_30"

return {
  -- Core
  NvimTreeFolderSrc = { fg = colors.blue },
  NvimTreeFolderTests = { fg = colors.red },
  NvimTreeFolderDocs = { fg = colors.yellow },
  NvimTreeFolderConfig = { fg = colors.cyan },
  NvimTreeFolderBuild = { fg = colors.vibrant_green },
  NvimTreeFolderDeps = { fg = colors.orange },

  -- React / Next.js
  NvimTreeFolderComponents = { fg = colors.yellow },
  NvimTreeFolderHooks = { fg = colors.teal },
  NvimTreeFolderContext = { fg = colors.pink },
  NvimTreeFolderPages = { fg = colors.blue },
  NvimTreeFolderLayouts = { fg = colors.orange },
  NvimTreeFolderStyles = { fg = colors.pink },
  NvimTreeFolderAssets = { fg = colors.nord_blue },

  -- Vue
  NvimTreeFolderComposables = { fg = colors.teal },
  NvimTreeFolderStore = { fg = colors.purple },
  NvimTreeFolderViews = { fg = colors.blue },

  -- Angular
  NvimTreeFolderModules = { fg = colors.yellow },
  NvimTreeFolderServices = { fg = colors.red },
  NvimTreeFolderPipes = { fg = colors.green },
  NvimTreeFolderGuards = { fg = colors.teal },
  NvimTreeFolderEnvironments = { fg = colors.cyan },

  -- Django
  NvimTreeFolderApps = { fg = colors.green },
  NvimTreeFolderTemplates = { fg = colors.yellow },
  NvimTreeFolderMigrations = { fg = colors.purple },
  -- static/media ya usan NvimTreeFolderAssets

  -- Node.js / Express
  NvimTreeFolderRoutes = { fg = colors.blue },
  NvimTreeFolderControllers = { fg = colors.orange },
  NvimTreeFolderMiddlewares = { fg = colors.teal },
  NvimTreeFolderModels = { fg = colors.purple },
  NvimTreeFolderScripts = { fg = colors.yellow },

  -- C / C++
  NvimTreeFolderInclude = { fg = colors.teal },
  NvimTreeFolderCmake = { fg = colors.green },
  NvimTreeFolderMake = { fg = colors.green },

  -- Infra
  NvimTreeFolderDocker = { fg = colors.cyan },
  NvimTreeFolderK8s = { fg = colors.blue },
  NvimTreeFolderHelm = { fg = colors.yellow },
  NvimTreeFolderCI = { fg = colors.red },
}
