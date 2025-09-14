local colors = require("themes").get_theme_tb "base_30"
local blend = require("themes.colors").blend

return {
  BufferLineFill = { bg = colors.black },
  BufferLineBackground = { fg = colors.grey, bg = colors.black },

  BufferLineBufferVisible = { fg = colors.grey_fg, bg = colors.black },
  BufferLineBufferSelected = { fg = colors.blue, bg = colors.one_bg, bold = true },

  BufferLineSeparator = { fg = colors.black, bg = colors.black },
  BufferLineSeparatorSelected = { fg = colors.one_bg, bg = colors.one_bg },
  BufferLineSeparatorVisible = { fg = colors.black, bg = colors.black },

  BufferLineIndicatorSelected = { fg = colors.blue, bg = colors.one_bg },
  BufferLineModified = { fg = colors.orange, bg = colors.black },
  BufferLineModifiedVisible = { fg = colors.orange, bg = colors.black },
  BufferLineModifiedSelected = { fg = colors.orange, bg = colors.one_bg },

  BufferLineCloseButton = { fg = colors.light_grey, bg = colors.black },
  BufferLineCloseButtonVisible = { fg = colors.light_grey, bg = colors.black },
  BufferLineCloseButtonSelected = { fg = colors.red, bg = colors.one_bg },

  -- tus custom
  BufferlineRun = { fg = colors.teal, bg = blend(colors.teal, colors.black, 0.15) },
  BufferlineSplit = { fg = colors.green, bg = blend(colors.green, colors.black, 0.15) },
  BufferlineTheme = { fg = colors.yellow, bg = blend(colors.yellow, colors.black, 0.15) },
  BufferlineTransparency = { fg = colors.blue, bg = blend(colors.blue, colors.black, 0.15) },
  BufferlineCloseAll = { fg = colors.red, bg = blend(colors.red, colors.black, 0.15) },
}
