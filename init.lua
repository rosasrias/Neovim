vim.g.start_time = vim.uv.hrtime()
vim.g.mapleader = " "

require "core.options"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
local lazy_cfg = require "core.lazy_cfg"

-- load plugins
require("lazy").setup({
  spec = {
    { import = "plugins.editor" },
    { import = "plugins.ui" },
    { import = "plugins.lsp" },
    { import = "plugins.tools" },
    { import = "plugins.debug" },
  },
}, lazy_cfg)

require "core.mappings"
require "core.autocommands"
require "ui"
require("themes").load_all_highlights()
require("colorify").run()

vim.filetype.add {
  extension = {
    xaml = "xml",
    ["http"] = "http",
  },
}

vim.g.db_ui_custom_connections = {
  {
    name = "ECOMG4 MySQL (Docker)",
    url = "mysql://ecom:ecom123@localhost:3306/ecommerce_mvp",
  },
}
