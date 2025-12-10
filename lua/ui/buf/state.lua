-- lua/ui/bufferline/state.lua
local M = {}

M.scroll_offset = 1
M.visible_buffers = {}
M.last_window_width = nil

function M.update_scroll_offset(total_buffers)
  if M.scroll_offset > total_buffers then
    M.scroll_offset = math.max(1, total_buffers)
  end
end

function M.scroll_left()
  local total = #vim.fn.getbufinfo { buflisted = 1 }
  if total == 0 then
    return
  end

  if M.scroll_offset > 1 then
    M.scroll_offset = M.scroll_offset - 1
  else
    M.scroll_offset = total
  end
  vim.cmd "redrawtabline"
end

function M.scroll_right()
  local total = #vim.fn.getbufinfo { buflisted = 1 }
  if total == 0 then
    return
  end

  if M.scroll_offset < total then
    M.scroll_offset = M.scroll_offset + 1
  else
    M.scroll_offset = 1
  end
  vim.cmd "redrawtabline"
end

function M.get_visible_range(total_buffers, available_space, min_buffers)
  local visible_count = 0
  local total_width = 0
  local last_index = M.scroll_offset

  -- Reset si no hay buffers
  if total_buffers == 0 then
    M.scroll_offset = 1
    return 1, 0
  end

  -- Calcular cuántos buffers caben realmente
  for i = M.scroll_offset, total_buffers do
    local buf_width = M.visible_buffers[i] and M.visible_buffers[i].width or 0
    if (total_width + buf_width > available_space) and (visible_count >= min_buffers) then
      break
    end
    total_width = total_width + buf_width
    visible_count = visible_count + 1
    last_index = i
  end

  -- Ajustar scroll si estamos mostrando menos de lo mínimo
  if visible_count < min_buffers and M.scroll_offset > 1 then
    local needed = min_buffers - visible_count
    M.scroll_offset = math.max(1, M.scroll_offset - needed)
    return M.get_visible_range(total_buffers, available_space, min_buffers)
  end

  return visible_count, last_index
end

return M
