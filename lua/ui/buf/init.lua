local M = {}

-- Estado global para el scroll
local buf_scroll_offset = 1

-- Scroll handlers circulares
function _G.BufflineScrollLeft(_, _, _, _)
  local total = #vim.fn.getbufinfo { buflisted = 1 }
  if buf_scroll_offset > 1 then
    buf_scroll_offset = buf_scroll_offset - 1
  else
    buf_scroll_offset = total
  end
  vim.cmd "redrawtabline"
end

function _G.BufflineScrollRight(_, _, _, _)
  local total = #vim.fn.getbufinfo { buflisted = 1 }
  if buf_scroll_offset < total then
    buf_scroll_offset = buf_scroll_offset + 1
  else
    buf_scroll_offset = 1
  end
  vim.cmd "redrawtabline"
end

vim.cmd "function! BufflineGoToBuf(bufnr,b,c,d) \n execute 'b'..a:bufnr \n endfunction"
vim.cmd [[
   function! BufflineKillBuf(bufnr,b,c,d)
        call luaeval('require("ui.buf.fn").close_buffer(_A)', a:bufnr)
  endfunction]]
vim.cmd "function! ToggleTheme(a,b,c,d) \n lua require('themes.pick').random() \n endfunction"
vim.cmd "function! ToggleTrans(a,b,c,d) \n lua require('themes').toggle_transparency() \n endfunction"
vim.cmd "function! CloseAll(a,b,c,d) \n q \n endfunction"
vim.cmd "function! Split(a,b,c,d) \n vsplit \n endfunction"
vim.cmd "function! Run(a,b,c,d) \n lua require('core.functions').build_run() \n endfunction"

vim.api.nvim_create_user_command("BufflinePrev", function()
  require("ui.buf.fn").tabuflinePrev()
end, {})
vim.api.nvim_create_user_command("BufflineNext", function()
  require("ui.buf.fn").tabuflineNext()
end, {})

-- Constantes e iconos
local ICONS = {
  close = "  ",
  run = "",
  run_html = "󰀂",
  theme = "󱥚 ",
  trans = "󱡓",
  split = "",
  close_all = "󰅖 ",
}

local EXCLUDED_FILETYPES = { "NvimTree", "help", "dasher", "lir", "alpha", "toggleterm" }

-- Helpers

local function get_file_icon(buf)
  local devicons = require "nvim-web-devicons"
  local buf_name = vim.api.nvim_buf_get_name(buf)
  local file_name = vim.fn.fnamemodify(buf_name, ":t")
  local file_ext = vim.fn.fnamemodify(file_name, ":e")

  local icon, hl_group = devicons.get_icon(file_name, file_ext, { default = true })
  icon = icon or "󰈚"
  hl_group = hl_group or "DevIconDefault"

  -- usa el highlight del tab activo
  -- clona el grupo del devicon pero sin fondo
  local new_hl = hl_group .. "NoBG"
  if vim.fn.hlID(new_hl) == 0 then
    local color = vim.api.nvim_get_hl(0, { name = hl_group }) or {}
    vim.api.nvim_set_hl(0, new_hl, { fg = color.fg or "#cccccc", bg = "NONE", link = nil })
  end
  hl_group = new_hl

  return icon, hl_group
end

local function format_buffer(buf, filename)
  local is_active = buf == vim.api.nvim_get_current_buf()
  local icon, icon_hl = get_file_icon(buf)

  -- truncar si se pasa de largo
  if #filename > 25 then
    filename = "…" .. filename:sub(-22)
  end

  local close_btn
  if is_active then
    filename = "%#" .. icon_hl .. "# " .. icon .. " %#BufflineBufOnActive# " .. filename
    close_btn = vim.bo[buf].modified and ("%" .. buf .. "@BufflineKillBuf@%#BuffLineBufOnModified#  ")
      or ("%#BuffLineBufOnClose#%" .. buf .. "@BufflineKillBuf@" .. ICONS.close .. "%X")
  else
    filename = "%#" .. icon_hl .. "# " .. icon .. " %#BufflineBufOnInactive# " .. filename
    close_btn = vim.bo[buf].modified and ("%" .. buf .. "@BufflineKillBuf@%#BuffLineBufOffModified#  ")
      or ("%#BuffLineBufOffClose#%" .. buf .. "@BufflineKillBuf@" .. ICONS.close .. "%X")
  end

  return "%" .. buf .. "@BufflineGoToBuf@" .. filename .. " " .. close_btn .. "%X%#BufflineEmptyColor# "
end

-- Manejo de nombres duplicados

local function create_tab(buf)
  local fullpath = vim.api.nvim_buf_get_name(buf)
  if fullpath == "" then
    return ""
  end

  local filename = vim.fn.fnamemodify(fullpath, ":t")

  -- buscar conflictos (buffers con mismo nombre de archivo)
  local conflicts = {}
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted then
      if vim.fn.fnamemodify(vim.api.nvim_buf_get_name(b), ":t") == filename then
        table.insert(conflicts, b)
      end
    end
  end

  -- si no hay conflicto, mostramos solo el nombre
  if #conflicts == 1 then
    return format_buffer(buf, filename)
  end

  -- normalizar separadores de ruta a "/"
  local norm_path = fullpath:gsub("\\", "/")
  local parts = vim.split(norm_path, "/", { plain = true })

  -- empezamos desde el archivo y vamos hacia atrás hasta diferenciar
  local idx = #parts
  local display = parts[idx]
  idx = idx - 1

  while idx > 0 do
    local candidate = parts[idx] .. "/" .. display
    local unique = true

    for _, b in ipairs(conflicts) do
      if b ~= buf then
        local other = vim.api.nvim_buf_get_name(b):gsub("\\", "/")
        if other:sub(-#candidate) == candidate then
          unique = false
          break
        end
      end
    end

    display = candidate
    if unique then
      break
    end
    idx = idx - 1
  end

  return format_buffer(buf, display)
end

-- NvimTree width

local function tree_width()
  for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].ft == "NvimTree" then
      return vim.api.nvim_win_get_width(win) + 1
    end
  end
  return 0
end

-- Tabline

local function tab_width(tab)
  local clean = tab:gsub("%%#.-#", ""):gsub("%%.-@", ""):gsub("%%X", "")
  return vim.fn.strdisplaywidth(clean)
end

local function min_buffers()
  -- si hay un NvimTree abierto, reducimos a 3
  for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].ft == "NvimTree" then
      return 3
    end
  end
  return 4
end

M.getTabline = function()
  local columns = vim.o.columns
  local available_space = math.max(columns - 40, 20) -- 40 reservado aprox.
  local MIN_BUFFERS = min_buffers()

  local all_tabs = {}
  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    local filename = vim.api.nvim_buf_get_name(buf)
    if filename ~= "" and not vim.tbl_contains(EXCLUDED_FILETYPES, vim.bo[buf].ft) then
      if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
        table.insert(all_tabs, create_tab(buf))
      end
    end
  end

  local buffline, total_len, shown = "", 0, 0
  local last_index = buf_scroll_offset
  for i = buf_scroll_offset, #all_tabs do
    local tab = all_tabs[i]
    local tab_len = tab_width(tab)
    if (total_len + tab_len > available_space) and (shown >= MIN_BUFFERS) then
      break
    end
    buffline = buffline .. "%#BufflineEmptyColor#" .. tab
    total_len = total_len + tab_len
    shown = shown + 1
    last_index = i
  end

  -- Scrolls: fijate cómo usamos last_index
  local scroll_left = (buf_scroll_offset > 1) and "%#BufflineButtonScroll#%@v:lua.BufflineScrollLeft@  %X" or ""
  local scroll_right = (last_index < #all_tabs) and "%#BufflineButtonScroll#%@v:lua.BufflineScrollRight@  %X" or ""

  local start = (buffline ~= "") and "%#BufflineEmptyColor#" or "%#BuffLineEmpty#"
  local treespace = "%#BufflineTree#" .. string.rep(" ", tree_width())

  local run_icon = (vim.bo.filetype == "html") and ICONS.run_html or ICONS.run
  local buttons = table.concat({
    "%#BuffLineRun# %@Run@" .. run_icon,
    "%#BuffLineSplit# %@Split@" .. ICONS.split,
    "%#BufflineTrans# %@ToggleTrans@" .. ICONS.trans,
    "%#BufflineButton# %@ToggleTheme@" .. ICONS.theme,
    "%#BufflineCloseButton# %@CloseAll@" .. ICONS.close_all,
  }, " ")

  return treespace .. scroll_left .. start .. buffline .. scroll_right .. "%=" .. buttons
end

M.setup = function()
  if #vim.fn.getbufinfo { buflisted = 1 } >= 1 then
    vim.opt.showtabline = 2
    vim.opt.tabline = '%!v:lua.require("ui.buf").getTabline()'
  end
end

-- Keymaps

vim.keymap.set("n", "<TAB>", ":BufflineNext<CR>", { silent = true })
vim.keymap.set("n", "<S-TAB>", ":BufflinePrev<CR>", { silent = true })

return M
