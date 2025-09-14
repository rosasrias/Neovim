local colors = require("themes").get_theme_tb "base_30"

return {
  fill = { bg = colors.black },
  background = { fg = colors.grey, bg = colors.black },

  buffer_visible = { fg = colors.grey_fg, bg = colors.black },
  buffer_selected = { fg = colors.blue, bg = colors.one_bg, bold = true },

  separator = { fg = colors.black, bg = colors.black },
  separator_selected = { fg = colors.one_bg, bg = colors.one_bg },
  separator_visible = { fg = colors.black, bg = colors.black },

  indicator_selected = { fg = colors.blue, bg = colors.one_bg },
  modified = { fg = colors.green, bg = colors.black },
  modified_visible = { fg = colors.green, bg = colors.black },
  modified_selected = { fg = colors.green, bg = colors.one_bg },

  close_button = { fg = colors.light_grey, bg = colors.black },
  close_button_visible = { fg = colors.light_grey, bg = colors.black },
  close_button_selected = { fg = colors.red, bg = colors.one_bg },
}
