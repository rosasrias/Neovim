local custom_autocmd_group = vim.api.nvim_create_augroup("CustomAutocmdGroup", { clear = false })

--- Check if a path is a directory
---@param path string
---@return boolean
local function is_directory(path)
  return vim.fn.isdirectory(path) == 1
end

-- Open nvim-tree when entering a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    if is_directory(data.file) then
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end
  end,
  desc = "Open nvim-tree when entering a directory",
})

-- Show floating diagnostics when cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float { scope = "cursor", focusable = false }
  end,
  desc = "Show LSP diagnostics on hover",
})

-- Highlight text yanked
vim.api.nvim_create_autocmd("TextYankPost", {
  group = custom_autocmd_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight copied text",
})

-- Close specific windows with 'q'
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = custom_autocmd_group,
  callback = function()
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
    if vim.tbl_contains({ "help", "nofile", "quickfix" }, buftype) and vim.fn.maparg("q", "n") == "" then
      vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>close<cr>", { silent = true, noremap = true })
    end
  end,
  desc = "Close help windows, quickfix, etc. with 'q'",
})

-- Configure quickfix buffer so that it is not modifiable
vim.api.nvim_create_autocmd("FileType", {
  group = custom_autocmd_group,
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
  desc = "Don't list quickfix buffers",
})

-- Desactivate line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
  desc = "Disable line numbers in terminal buffers",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.tbl_map(function(path)
    return vim.fs.normalize(vim.uv.fs_realpath(path))
  end, vim.fn.glob(vim.fn.stdpath "config" .. "/lua/**/*.lua", true, true, true)),
  group = vim.api.nvim_create_augroup("ReloadConfig", {}),
  callback = function(opts)
    local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r")
    local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
    local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")
    if module then
      require("plenary.reload").reload_module(module)
    end
  end,
})

-- Auto-reload when editing core/cfg.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/core/cfg.lua",
  callback = function()
    -- Clean cached modules
    for name, _ in pairs(package.loaded) do
      if name:match "^core%.cfg" or name:match "^themes" then
        package.loaded[name] = nil
      end
    end

    local cfg = require "core.cfg"

    if cfg and cfg.ui then
      vim.g.nvimTheme = cfg.ui.theme
      vim.g.transparency = cfg.ui.transparency

      -- Reapply highlights dynamically
      require("themes").load_all_highlights()

      local ok, cmp = pcall(require, "cmp")
      if ok then
        cmp.setup {
          window = {
            completion = {
              border = vim.g.transparency and "rounded" or "solid",
              scrollbar = false,
              winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
            },
            documentation = {
              border = vim.g.transparency and "rounded" or "solid",
              scrollbar = false,
              winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
            },
          },
        }
      end

      -- Apply transparency effect if defined
      if vim.g.transparency then
        vim.notify("Transparency: Enabled", vim.log.levels.INFO)
      else
        vim.notify("Transparency: Disabled", vim.log.levels.INFO)
      end

      vim.notify("Theme reloaded: " .. vim.g.nvimTheme, vim.log.levels.INFO)
    else
      vim.notify("Could not read cfg.ui fields!", vim.log.levels.WARN)
    end
  end,
  desc = "Auto-reload Neovim theme & transparency when core/cfg.lua changes",
})

vim.api.nvim_create_user_command("ReloadTheme", function()
  for name, _ in pairs(package.loaded) do
    if name:match "^core%.cfg" or name:match "^themes" then
      package.loaded[name] = nil
    end
  end

  local cfg = require "core.cfg"
  vim.g.nvimTheme = cfg.ui.theme
  vim.g.transparency = cfg.ui.transparency

  require("themes").load_all_highlights()

  local ok, cmp = pcall(require, "cmp")
  if ok then
    cmp.setup {
      window = {
        completion = {
          border = vim.g.transparency and "rounded" or "solid",
          scrollbar = false,
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
          border = vim.g.transparency and "rounded" or "solid",
          scrollbar = false,
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
        },
      },
    }
  end

  vim.notify("Theme reloaded: " .. vim.g.nvimTheme, vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command("Ranger", function()
  require("core.functions").ranger_toggle()
end, { desc = "Open/Toggle Ranger" })

-- Use 4 spaces for Python
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("PythonIndent", { clear = true }),
  pattern = "python",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
  desc = "Set indentation to 4 spaces for Python",
})

-- Use 2 spaces for Lua and JavaScript files
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("IndentSettings", { clear = true }),
  pattern = { "lua", "javascript", "typescript", "json", "yaml", "html", "css" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
  desc = "Set indentation to 2 spaces for common web dev files",
})

-- ========= helpers =========

local function get_main_window()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype
    if ft ~= "NvimTree" and ft ~= "terminal" then
      return win
    end
  end
  return vim.api.nvim_get_current_win()
end

local function get_last_terminal_window()
  local terms = {}

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      local pos = vim.api.nvim_win_get_position(win)
      table.insert(terms, { win = win, row = pos[1], col = pos[2] })
    end
  end

  if #terms == 0 then
    return nil
  end

  table.sort(terms, function(a, b)
    if a.col == b.col then
      return a.row < b.row
    end
    return a.col < b.col
  end)

  return terms[#terms].win
end

-- ========= open terminal =========

local function open_terminal_vscode_style(preferred_direction, command)
  command = command or vim.o.shell
  local term_win = get_last_terminal_window()

  if term_win then
    vim.api.nvim_set_current_win(term_win)

    if preferred_direction == "horizontal" then
      vim.cmd "vsplit"
      vim.cmd "vertical resize 40"
    else
      vim.cmd "split"
      vim.cmd "resize 15"
    end
  else
    vim.api.nvim_set_current_win(get_main_window())

    if preferred_direction == "horizontal" then
      vim.cmd "split"
      vim.cmd "resize 10"
    else
      vim.cmd "vsplit"
      vim.cmd "vertical resize 40"
    end
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, buf)
  vim.fn.termopen(command)
  vim.cmd "startinsert"
end

-- ========= winbar logic =========

local term_winbar_group = vim.api.nvim_create_augroup("TerminalWinbar", { clear = true })

local function get_terminal_windows_ordered()
  local terms = {}

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      local pos = vim.api.nvim_win_get_position(win)
      table.insert(terms, {
        win = win,
        row = pos[1],
        col = pos[2],
      })
    end
  end

  table.sort(terms, function(a, b)
    if a.col == b.col then
      return a.row < b.row
    end
    return a.col < b.col
  end)

  return terms
end

local function refresh_terminal_winbars()
  local terms = get_terminal_windows_ordered()
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

  for i, term in ipairs(terms) do
    local label = "  Terminal " .. i .. " — " .. cwd .. " "
    vim.api.nvim_win_set_option(term.win, "winbar", "%#TerminalTitle#" .. label .. "%*%=")
  end
end

vim.api.nvim_create_autocmd({ "TermOpen", "BufWipeout" }, {
  group = term_winbar_group,
  callback = function()
    vim.schedule(refresh_terminal_winbars)
  end,
})

-- ========= keymaps =========

vim.keymap.set("n", "<leader>th", function()
  open_terminal_vscode_style "horizontal"
end, { desc = "[T]erminal [H]orizontal" })

vim.keymap.set("n", "<leader>tv", function()
  open_terminal_vscode_style "vertical"
end, { desc = "[T]erminal [V]ertical" })

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.wo.winhl = table.concat({
      "Normal:TerminalNormal",
      "SignColumn:TerminalNormal",
    }, ",")
  end,
})

local function setup_devicon_hl()
  local devicons = require "nvim-web-devicons"

  for _, icon in pairs(devicons.get_icons()) do
    local hl = icon.highlight
    if hl then
      local new_hl = hl .. "NoBG"

      local fg_src = vim.api.nvim_get_hl(0, { name = hl }) or {}
      local bg_src = vim.api.nvim_get_hl(0, { name = "BufflineBufOnInactive" }) or {}

      vim.api.nvim_set_hl(0, new_hl, {
        fg = fg_src.fg,
        bg = bg_src.bg,
      })
    end
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = setup_devicon_hl,
})
