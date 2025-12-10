-- lua/ui/buf/handlers.lua
local buffers = require "ui.buf.buffers"

vim.cmd [[
  function! BufflineGoToBuf(bufnr, b, c, d)
    execute 'b' .. a:bufnr
  endfunction

  function! BufflineKillBuf(bufnr, b, c, d)
  call luaeval('require("ui.buf.buffers").close_buffer(_A)', a:bufnr)
  endfunction

  function! BufflineScrollLeft(a, b, c, d)
    lua require('ui.buf.state').scroll_left()
  endfunction

  function! BufflineScrollRight(a, b, c, d)
    lua require('ui.buf.state').scroll_right()
  endfunction

  function! ToggleTheme(a, b, c, d)
    lua require('themes.pick').random()
  endfunction

  function! ToggleTrans(a, b, c, d)
    lua require('themes').toggle_transparency()
  endfunction

  function! CloseAll(a, b, c, d)
    q
  endfunction

  function! Split(a, b, c, d)
    vsplit
  endfunction

  function! Run(a, b, c, d)
    lua require('core.functions').build_run()
  endfunction
]]

-- User commands (estos se mantienen como están)
vim.api.nvim_create_user_command("BufflinePrev", function()
  vim.cmd("b " .. buffers.get_prev_buffer())
end, {})

vim.api.nvim_create_user_command("BufflineNext", function()
  vim.cmd("b " .. buffers.get_next_buffer())
end, {})
