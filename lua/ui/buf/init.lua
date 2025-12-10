local M = {}

function M.setup()
  -- Load all modules to register globals
  require "ui.buf.handlers"
  require("ui.buf.config").setup()

  -- Initial setup
  if #vim.fn.getbufinfo { buflisted = 1 } >= 1 then
    vim.opt.showtabline = 2
    vim.opt.tabline = [[%!v:lua.require('ui.buf.render').get_tabline()]]
  end
end

return M
