local colors = require("themes").get_theme_tb "base_30"
local utils = require "themes.colors"

return {
  -- UI Header
  DBUIHeader = {
    fg = colors.blue,
    bg = utils.blend(colors.nord_blue, colors.black, 0.15),
  },

  -- Database names
  DBUIDatabase = {
    fg = colors.purple,
    bg = "NONE",
  },

  -- Tables
  DBUITable = {
    fg = colors.blue,
    bg = "NONE",
  },

  -- Columns
  DBUIColumn = {
    fg = colors.cyan,
    bg = "NONE",
  },

  -- Primary / Foreign keys
  DBUIKey = {
    fg = colors.orange,
    bg = "NONE",
  },

  -- Results
  DBUIResult = {
    fg = colors.white,
    bg = utils.blend(colors.one_bg, colors.black, 0.30),
  },

  -- Connections panel
  DBUIConn = {
    fg = colors.green,
    bg = "NONE",
  },

  -- Query text
  DBUIQuery = {
    fg = colors.yellow,
    bg = "NONE",
  },
}
