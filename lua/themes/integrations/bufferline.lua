local colors = require("themes").get_theme_tb "base_30"
local utils = require "themes.colors"

return {
  BufflineBufOnActive = { fg = colors.blue, bg = utils.blend(colors.nord_blue, colors.black, 0.10) },
  BufflineBufOnInactive = {
    fg = utils.blend(colors.white, colors.black, 0.30),
    bg = colors.black,
  },
  BufflineBufOnModified = { fg = colors.blue, bg = utils.blend(colors.blue, colors.black, 0.10) },
  BuffLineBufOffModified = { fg = colors.blue, bg = utils.blend(colors.blue, colors.black, 0.10) },
  BufflineBufOnClose = { fg = colors.red, bg = utils.blend(colors.red, colors.black, 0.10) },
  BuffLineBufOffClose = {
    fg = colors.red,
    bg = utils.blend(colors.red, colors.black, 0.10),
  },

  BufflineArrow = { fg = colors.blue },
  BuffLineTree = { bg = colors.darker_black },
  BuffLineEmpty = { bg = colors.black },
  BuffLineEmptyColor = { bg = colors.black },
  BuffLineButton = { bg = utils.blend(colors.sun, colors.black, 0.10), fg = colors.sun },
  BuffLineCloseButton = { bg = colors.red, fg = colors.black },
  BuffLineRun = { bg = utils.blend(colors.green, colors.black, 0.10), fg = colors.green },
  BuffLineSplit = { bg = utils.blend(colors.blue, colors.black, 0.10), fg = colors.blue },
  BufflineTrans = { bg = utils.blend(colors.purple, colors.black, 0.10), fg = colors.purple },
  NoBg = { bg = colors.black, fg = "NONE" },
  BufflineButtonScroll = { bg = colors.black, fg = colors.blue },
}
