local colors = require("themes").get_theme_tb "base_30"

return {
  NotifyBackground = { bg = colors.darker_black },
  NotifyLogTime = { fg = colors.white, bg = colors.darker_black },
  NotifyCount = { bg = colors.darker_black, bold = true },
  NotifyCountIcon = { bg = colors.darker_black, bold = true },
  NotifyFooter = { bg = colors.darker_black },
  NotifySeparator = { bg = colors.darker_black },
  NotifySource = { bg = colors.darker_black },

  -- Borders
  NotifyINFOBorder = { fg = colors.darker_black, bg = colors.darker_black },
  NotifyWARNBorder = { fg = colors.darker_black, bg = colors.darker_black },
  NotifyERRORBorder = { fg = colors.darker_black, bg = colors.darker_black },
  NotifyDEBUGBorder = { fg = colors.darker_black, bg = colors.darker_black },
  NotifyTRACEBorder = { fg = colors.darker_black, bg = colors.darker_black },

  -- Icons
  NotifyERRORIcon = { fg = colors.darker_black, bg = colors.red },
  NotifyWARNIcon = { fg = colors.darker_black, bg = colors.yellow },
  NotifyINFOIcon = { fg = colors.darker_black, bg = colors.blue },
  NotifyDEBUGIcon = { fg = colors.darker_black, bg = colors.purple },
  NotifyTRACEIcon = { fg = colors.darker_black, bg = colors.green },

  -- Titles
  NotifyERRORTitle = { fg = colors.darker_black, bg = colors.red, bold = true },
  NotifyWARNTitle = { fg = colors.darker_black, bg = colors.yellow, bold = true },
  NotifyINFOTitle = { fg = colors.darker_black, bg = colors.blue, bold = true },
  NotifyDEBUGTitle = { fg = colors.darker_black, bg = colors.purple, bold = true },
  NotifyTRACETitle = { fg = colors.darker_black, bg = colors.green, bold = true },

  -- Bodies
  NotifyERRORBody = { fg = colors.red, bg = colors.darker_black },
  NotifyWARNBody = { fg = colors.yellow, bg = colors.darker_black },
  NotifyINFOBody = { fg = colors.blue, bg = colors.darker_black },
  NotifyDEBUGBody = { fg = colors.purple, bg = colors.darker_black },
  NotifyTRACEBody = { fg = colors.green, bg = colors.darker_black },
}
