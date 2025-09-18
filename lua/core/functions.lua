local function notify(message, level, options)
  vim.notify(message, level or vim.log.levels.INFO, options)
end

local function toggle_option(option)
  local value = not vim.api.nvim_get_option_value(option, {})
  vim.opt[option] = value
  notify(option .. " set to " .. tostring(value))
end

local function toggle_tabline()
  local value = vim.api.nvim_get_option_value("showtabline", {})
  value = value == 2 and 0 or 2
  vim.opt.showtabline = value
  notify("showtabline set to " .. tostring(value))
end

local function lazygit_toggle()
  local lazygit = require("toggleterm.terminal").Terminal:new {
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = { border = "rounded" },
    on_open = function(term)
      vim.cmd "startinsert!"
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
  }
  lazygit:toggle()
end

local function ranger_toggle()
  if vim.fn.executable "ranger" == 0 then
    notify "ranger isn't installed"
    return
  end

  local ranger = require("toggleterm.terminal").Terminal:new {
    cmd = "ranger",
    direction = "float",
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
  }
  ranger:toggle()
end

local M = {}

M.toggle_option = toggle_option
M.toggle_tabline = toggle_tabline
M.lazygit_toggle = lazygit_toggle
M.ranger_toggle = ranger_toggle

return M
