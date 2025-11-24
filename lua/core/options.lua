local opt = vim.opt
local o = vim.o
local g = vim.g

opt.fileformats = { "unix", "dos" }
o.shell = "pwsh"
o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
o.shellquote = ""
o.shellxquote = ""
o.laststatus = 3
o.showmode = false
o.splitkeep = "screen"
o.wrap = false
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.fileformat = "unix"
opt.fileformats = { "unix", "dos" }
o.swapfile = false
o.backup = false
o.writebackup = false
o.ttyfast = true

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 1
o.ruler = true

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 300
o.undofile = true
o.termguicolors = true
o.cmdheight = 0

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 200

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

local cfg = require("core.cfg").ui

g.toggle_cmp = true
g.code_action_menu_window_border = "single"
g.nvimTheme = cfg.theme
g.themeCache = vim.fn.stdpath "data" .. "/colors_data/"
g.transparency = cfg.transparency
g.statusStyle = cfg.statusstyle

if vim.loop.os_uname().sysname == "Windows_NT" then
  g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
