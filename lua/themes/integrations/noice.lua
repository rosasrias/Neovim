local colors = require("themes").get_theme_tb("base_30")
local utils = require("themes.colors")

return {
  NoiceMini = { bg = colors.darker_black, fg = colors.white },
  NoiceCmdlinePopup = { bg = colors.darker_black, fg = colors.white },
  NoiceCmdlinePopupBorder = { bg = "NONE", fg = colors.darker_black },
  NoiceCmdlinePopupBorderSearch = { link = "NoiceCmdlinePopupBorder" },
  NoiceCmdlinePopupTitle = { bg = colors.darker_black, fg = colors.red, bold = true },
  NoiceCmdlinePopupTitleCmdline = { bg = colors.blue, fg = colors.darker_black, bold = true },
  NoiceCmdlinePopupTitleHelp = { bg = colors.red, fg = colors.darker_black, bold = true },
  NoiceCmdlinePopupTitleSearch = { bg = colors.blue, fg = colors.darker_black, bold = true },
  NoiceCmdlinePopupTitleFilter = { bg = colors.sun, fg = colors.darker_black, bold = true },
  NoiceLspProgressSpinner = { fg = utils.blend(colors.white, colors.black, 0.2) },
}
