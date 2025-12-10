-- lua/ui/bufferline/config.lua
local M = {}

M.keymaps = {
  { "n", "<Tab>", ":BufflineNext<CR>", { silent = true } },
  { "n", "<S-Tab>", ":BufflinePrev<CR>", { silent = true } },
  {
    "n",
    "<leader>bc",
    function()
      require("ui.buf.buffers").close_buffer()
    end,
    { silent = true },
  },
}

function M.setup()
  -- Set up keymaps
  for _, map in ipairs(M.keymaps) do
    ---@diagnostic disable-next-line: deprecated
    vim.keymap.set(unpack(map))
  end

  -- Set up autocmds
  vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "BufEnter", "WinResized" }, {
    callback = function()
      vim.schedule(function()
        if #vim.fn.getbufinfo { buflisted = 1 } >= 1 then
          vim.opt.showtabline = 2
          vim.opt.tabline = [[%!v:lua.require('ui.buf.render').get_tabline()]]
        end
      end)
    end,
  })
end

return M
