local colors = require("themes").get_theme_tb "base_30"

return {

  -- =====================================================
  -- Core families
  -- =====================================================
  NtmfNvimTreeCore = { fg = colors.blue },
  NtmfNvimTreeFrontend = { fg = colors.cyan },
  NtmfNvimTreeBackend = { fg = colors.red },
  NtmfNvimTreeState = { fg = colors.purple },
  NtmfNvimTreeDatabase = { fg = colors.orange },
  NtmfNvimTreeStyles = { fg = colors.magenta },
  NtmfNvimTreeAssets = { fg = colors.yellow },
  NtmfNvimTreeTests = { fg = colors.green },
  NtmfNvimTreeDocs = { fg = colors.light_grey },
  NtmfNvimTreeTooling = { fg = colors.blue },
  NtmfNvimTreeConfig = { fg = colors.grey },
  NtmfNvimTreeBuild = { fg = colors.orange },

  -- =====================================================
  -- Frontend subfamilies
  -- =====================================================
  NtmfNvimTreeComponents = { fg = colors.cyan },
  NtmfNvimTreeForms = { fg = colors.green },
  NtmfNvimTreeUI = { fg = colors.blue },
  NtmfNvimTreeLayout = { fg = colors.purple },
  NtmfNvimTreePages = { fg = colors.cyan },
  NtmfNvimTreeTemplates = { fg = colors.cyan },

  -- =====================================================
  -- State / logic subfamilies
  -- =====================================================
  NtmfNvimTreeHooks = { fg = colors.purple },
  NtmfNvimTreeTypes = { fg = colors.orange },
  NtmfNvimTreeUtils = { fg = colors.blue },

  -- =====================================================
  -- Assets subfamilies
  -- =====================================================
  NtmfNvimTreeImages = { fg = colors.yellow },
  NtmfNvimTreeIcons = { fg = colors.orange },
  NtmfNvimTreeFonts = { fg = colors.magenta },

  -- =====================================================
  -- Backend subfamilies
  -- =====================================================
  NtmfNvimTreeServices = { fg = colors.red },
  NtmfNvimTreeRoutes = { fg = colors.orange },
  NtmfNvimTreeSupabase = { fg = colors.green },

  -- =====================================================
  -- Generic / fallback
  -- =====================================================
  NtmfNvimTreeFile = { fg = colors.white },
  NtmfNvimTreeEntryFile = { fg = colors.blue },
}
