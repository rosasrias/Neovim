local theme = require "themes"
local utils = require "themes.colors"

local colors = theme and theme.get_theme_tb and theme.get_theme_tb "base_30"
local M = {}

local function configure_general()
  local general_highlights = {
    "Normal",
    "NormalFloat",
    "WinBar",
    "WinBarNC",
    "Folded",
    "FoldColumn",
    "LineNr",
    "CursorColumn",
    "ColorColumn",
    "SignColumn",
    "CursorLine",
    "MsgArea",
    "NvimTreeLineNr",
  }

  for _, hl in ipairs(general_highlights) do
    M[hl] = { bg = "NONE" }
  end

  M.WinSeparator = {
    fg = utils.blend(colors.white, colors.black, 0.6),
    bg = "NONE",
  }

  M.TermFloat = {
    fg = utils.blend(colors.white, colors.black, 0.6),
    bg = "NONE",
  }
end

local function configure_telescope()
  local telescope_highlights = {
    "TelescopeNormal",
    "TelescopePrompt",
    "TelescopeBorder",
    "TelescopeResults",
    "TelescopePromptNormal",
    "TelescopePromptPrefix",
    "TelescopeSelection",
  }

  for _, hl in ipairs(telescope_highlights) do
    M[hl] = { bg = "NONE" }
  end

  local blended_fg = utils.blend(colors.white, colors.black, 0.2)
  M.TelescopePromptBorder = { fg = blended_fg, bg = "NONE" }
  M.TelescopePreviewBorder = { fg = blended_fg, bg = "NONE" }
  M.TelescopeResultsBorder = { fg = blended_fg, bg = "NONE" }
end

local function configure_whichkey()
  local whichkey_highlights = {
    "WhichKey",
    "WhichKeyGroup",
    "WhichKeyDesc",
    "WhichKeyFloat",
  }

  for _, hl in ipairs(whichkey_highlights) do
    M[hl] = { bg = "NONE" }
  end
end

local function configure_cmp()
  local cmp_highlights = {
    "CmpNormal",
    "CmpItemAbbr",
    "CmpItemAbbrDeprecated",
    "CmpItemMenu",
    "CmpPmenu",
  }

  for _, hl in ipairs(cmp_highlights) do
    M[hl] = { bg = "NONE" }
  end

  M.CmpItemAbbrMatch = {
    bg = "NONE",
    bold = true,
  }
end

local function configure_noice()
  local noice_highlights = {
    "NoiceMini",
    "NoiceCmdlinePopup",
    "NoiceCmdlinePopupBorder",
    "NoiceCmdlinePopupBorderSearch",
    "NoiceCmdlinePopupTitle",
    "NotifyBackground",
    "NotifyINFOBorder",
    "NotifyWARNBorder",
    "NotifyERRORBorder",
    "NotifyDEBUGBorder",
    "NotifyTRACEBorder",
    "NotifyLogTime",
    "NotifyERRORIcon",
    "NotifyWARNIcon",
    "NotifyINFOIcon",
    "NotifyDEBUGIcon",
    "NotifyTRACEIcon",
    "NotifyERRORTitle",
    "NotifyWARNTitle",
    "NotifyINFOTitle",
    "NotifyDEBUGTitle",
    "NotifyTRACETitle",
    "NotifyERRORBody",
    "NotifyWARNBody",
    "NotifyINFOBody",
    "NotifyDEBUGBody",
    "NotifyTRACEBody",
  }

  for _, hl in ipairs(noice_highlights) do
    M[hl] = { bg = "NONE" }
  end
  M.NotifyINFOBorder = { fg = utils.blend(colors.blue, colors.black, 0.25), bg = "NONE" }
  M.NotifyWARNBorder = { fg = utils.blend(colors.yellow, colors.black, 0.25), bg = "NONE" }
  M.NotifyERRORBorder = { fg = utils.blend(colors.red, colors.black, 0.25), bg = "NONE" }
  M.NotifyDEBUGBorder = { fg = utils.blend(colors.blue, colors.black, 0.25), bg = "NONE" }
  M.NotifyTRACEBorder = { fg = utils.blend(colors.green, colors.black, 0.25), bg = "NONE" }
  M.NotifyBackground = { bg = "NONE", fg = "NONE" }
end

local function configure_miscellaneous()
  M.TreesitterContext = { bg = "NONE" }
  M.NvimTreeNormal = { bg = "NONE" }
  M.NvimTreeNormalNC = { bg = "NONE" }
  M.BuffLineTree = { bg = "NONE" }
  M.TabLine = { bg = "NONE" }
  M.TabLineFill = { bg = "NONE" }
  M.SagaNormal = { bg = "NONE" }
  M.SagaBorder = { bg = "NONE" }
  M.RenameNormal = { bg = "NONE" }
  M.RenameBorder = { bg = "NONE" }
  M.AlphaHeader = { bg = "NONE" }
  M.AlphaMessage = { bg = "NONE" }
  M.AlphaLabel = { bg = "NONE" }
  M.AlphaIcon = { bg = "NONE" }
  M.AlphaFooter = { bg = "NONE" }
  M.NvimTreeWinSeparator = { bg = "NONE" }
  M.CmpBorder = { fg = colors.grey, bg = "NONE" }
  M.CmpDocBorder = { fg = colors.grey, bg = "NONE" }
  M.NoiceCmdlinePopupBorder = { fg = colors.grey, bg = "NONE" }
  M.NvimTreeWinSeparator = { fg = colors.grey, bg = "NONE" }
  M.FloatBorder = { fg = colors.grey, bg = "NONE" }
end

-- Run all configuration
configure_general()
configure_telescope()
configure_whichkey()
configure_cmp()
configure_noice()
configure_miscellaneous()

return M
