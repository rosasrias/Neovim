local M = {}

local state = require "ui.buf.state"
local buffers = require "ui.buf.buffers"
local icons = require "ui.buf.icons"

function M.get_buffer_display_name(buf)
  local fullpath = vim.api.nvim_buf_get_name(buf)
  if fullpath == "" then
    return ""
  end

  local filename = vim.fn.fnamemodify(fullpath, ":t")
  local bufs_with_same_name = {}

  -- Find conflicts
  for _, other_buf in ipairs(buffers.get_listed_buffers()) do
    if other_buf ~= buf then
      local other_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(other_buf), ":t")
      if other_name == filename then
        table.insert(bufs_with_same_name, other_buf)
      end
    end
  end

  -- No conflict, return simple name
  if #bufs_with_same_name == 0 then
    return filename
  end

  -- Handle conflicts by showing path segments
  local norm_path = fullpath:gsub("\\", "/")
  local parts = vim.split(norm_path, "/", { plain = true })
  local idx = #parts
  local display = parts[idx]

  idx = idx - 1
  while idx > 0 do
    local candidate = parts[idx] .. "/" .. display
    local unique = true

    for _, other_buf in ipairs(bufs_with_same_name) do
      local other_path = vim.api.nvim_buf_get_name(other_buf):gsub("\\", "/")
      if other_path:sub(-#candidate) == candidate then
        unique = false
        break
      end
    end

    display = candidate
    if unique then
      break
    end
    idx = idx - 1
  end

  return display
end

function M.get_buffer_icon(buf)
  local devicons = require "nvim-web-devicons"
  local buf_name = vim.api.nvim_buf_get_name(buf)
  local file_name = vim.fn.fnamemodify(buf_name, ":t")
  local file_ext = vim.fn.fnamemodify(file_name, ":e")

  local icon, hl_group = devicons.get_icon(file_name, file_ext, { default = true })
  icon = icon or "󰈚"

  -- Create NoBG highlight variant if it doesn't exist
  local new_hl = hl_group .. "NoBG"
  if vim.fn.hlID(new_hl) == 0 then
    local color = vim.api.nvim_get_hl(0, { name = hl_group }) or {}
    vim.api.nvim_set_hl(0, new_hl, {
      fg = color.fg or "#cccccc",
      bg = "NONE",
      link = nil,
    })
  end

  return icon, new_hl
end

function M.calculate_buffer_width(buf)
  local display_name = M.get_buffer_display_name(buf)
  local truncated = #display_name > 25 and ("…" .. display_name:sub(-22)) or display_name

  -- Approximate width: icon (2) + spaces (2) + name + close button (3)
  return vim.fn.strdisplaywidth(truncated) + 7
end

-- Function to format a buffer using direct concatenation
function M.format_buffer(buf)
  local is_active = buf == vim.api.nvim_get_current_buf()
  local icon, icon_hl = M.get_buffer_icon(buf)
  local display_name = M.get_buffer_display_name(buf)

  -- truncate if it goes too far
  if #display_name > 25 then
    display_name = "…" .. display_name:sub(-22)
  end

  local close_btn
  if is_active then
    display_name = "%#" .. icon_hl .. "# " .. icon .. " %#BufflineBufOnActive# " .. display_name
    close_btn = vim.bo[buf].modified and ("%" .. buf .. "@BufflineKillBuf@%#BuffLineBufOnModified#  ")
      or ("%#BuffLineBufOnClose#%" .. buf .. "@BufflineKillBuf@" .. icons.ICONS.close .. "%X")
  else
    display_name = "%#" .. icon_hl .. "# " .. icon .. " %#BufflineBufOnInactive# " .. display_name
    close_btn = vim.bo[buf].modified and ("%" .. buf .. "@BufflineKillBuf@%#BuffLineBufOffModified#  ")
      or ("%#BuffLineBufOffClose#%" .. buf .. "@BufflineKillBuf@" .. icons.ICONS.close .. "%X")
  end

  return "%" .. buf .. "@BufflineGoToBuf@" .. display_name .. " " .. close_btn .. "%X%#BufflineEmptyColor# "
end

function M.get_tabline()
  local columns = vim.o.columns

  -- Dynamic available space calculation
  local tree_width = M.get_tree_width()
  local buttons_width = 50 -- Space for buttons on the right
  local available_space = columns - tree_width - buttons_width

  -- Get and prepare buffers
  local all_buffers = buffers.get_listed_buffers()
  local all_tabs = {}
  state.visible_buffers = {}

  for i, buf in ipairs(all_buffers) do
    local tab_str = M.format_buffer(buf)
    table.insert(all_tabs, tab_str)
    state.visible_buffers[i] = {
      buffer = buf,
      width = M.calculate_buffer_width(buf),
    }
  end

  -- Update scroll offset
  state.update_scroll_offset(#all_buffers)

  -- Calculate how many buffers fit
  local min_buffers = M.get_min_buffers()
  local visible_count, last_index = state.get_visible_range(#all_buffers, available_space, min_buffers)

  -- Build visible portion
  local buffline = ""
  for i = state.scroll_offset, state.scroll_offset + visible_count - 1 do
    if all_tabs[i] then
      buffline = buffline .. all_tabs[i]
    end
  end

  -- Build full tabline
  local scroll_left = (state.scroll_offset > 1) and "%#BufflineButtonScroll#%@BufflineScrollLeft@  %X" or ""
  local scroll_right = (last_index < #all_buffers) and "%#BufflineButtonScroll#%@BufflineScrollRight@  %X" or ""

  local start = (buffline ~= "") and "%#BufflineEmptyColor#" or "%#BuffLineEmpty#"
  local treespace = "%#BufflineTree#" .. string.rep(" ", tree_width)

  local run_icon = (vim.bo.filetype == "html") and icons.ICONS.run_html or icons.ICONS.run
  local buttons = table.concat({
    "%#BuffLineRun# %@Run@" .. run_icon,
    "%#BuffLineSplit# %@Split@" .. icons.ICONS.split,
    "%#BufflineTrans# %@ToggleTrans@" .. icons.ICONS.trans,
    "%#BufflineButton# %@ToggleTheme@" .. icons.ICONS.theme,
    "%#BufflineCloseButton# %@CloseAll@" .. icons.ICONS.close_all,
  }, " ")

  return treespace .. scroll_left .. start .. buffline .. scroll_right .. "%=" .. buttons
end

function M.get_tree_width()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].ft
    if ft == "NvimTree" or ft == "neo-tree" then
      return vim.api.nvim_win_get_width(win) + 1
    end
  end
  return 0
end

function M.get_min_buffers()
  return M.get_tree_width() > 0 and 3 or 4
end

return M
