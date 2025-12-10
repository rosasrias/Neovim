local M = {}

local EXCLUDED_FILETYPES = {
  NvimTree = true,
  help = true,
  dasher = true,
  lir = true,
  alpha = true,
  toggleterm = true,
  ["neo-tree"] = true,
  Outline = true,
}

function M.is_valid_buffer(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return false
  end
  if not vim.bo[buf].buflisted then
    return false
  end
  if not vim.api.nvim_buf_is_loaded(buf) then
    return false
  end
  if vim.api.nvim_buf_get_name(buf) == "" then
    return false
  end
  if EXCLUDED_FILETYPES[vim.bo[buf].ft] then
    return false
  end
  return true
end

function M.get_listed_buffers()
  local bufs = vim.api.nvim_list_bufs()
  local filtered = {}

  for _, buf in ipairs(bufs) do
    if M.is_valid_buffer(buf) then
      table.insert(filtered, buf)
    end
  end

  return filtered
end

function M.get_next_buffer()
  local bufs = M.get_listed_buffers()
  local current = vim.api.nvim_get_current_buf()

  for i, buf in ipairs(bufs) do
    if buf == current then
      return bufs[i % #bufs + 1]
    end
  end

  return bufs[1] or current
end

function M.get_prev_buffer()
  local bufs = M.get_listed_buffers()
  local current = vim.api.nvim_get_current_buf()

  for i, buf in ipairs(bufs) do
    if buf == current then
      return bufs[(i - 2) % #bufs + 1]
    end
  end

  return bufs[#bufs] or current
end

function M.close_buffer(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  -- Terminal handling
  if vim.bo[bufnr].buftype == "terminal" then
    vim.cmd(vim.bo[bufnr].buflisted and "set nobl | enew" or "hide")
    return
  end

  -- If closing current buffer, switch to next
  if bufnr == vim.api.nvim_get_current_buf() then
    vim.cmd("b " .. M.get_next_buffer())
  end

  vim.cmd("silent! confirm bd" .. bufnr)
end

return M
