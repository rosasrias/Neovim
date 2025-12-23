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

local function open_floating_terminal(opts)
  local command = opts.command or vim.o.shell
  local mode = opts.mode or "horizontal"

  -- Detectar NvimTree
  local nvimtree_width = 0
  local ok, view = pcall(require, "nvim-tree.view")
  if ok and view.is_visible() then
    nvimtree_width = view.View.width
  end

  local lines = vim.o.lines
  local columns = vim.o.columns

  local config

  if mode == "horizontal" then
    local height = math.floor(lines * 0.3)
    local bottom_padding = 3

    config = {
      relative = "editor",
      width = columns - nvimtree_width - 3,
      height = height,
      row = lines - height - bottom_padding,
      col = nvimtree_width,
      border = "solid",
      title = " Terminal ",
      title_pos = "left",
      style = "minimal",
    }
  elseif mode == "vertical" then
    local width = math.floor(columns * 0.4)

    config = {
      relative = "editor",
      width = width,
      height = lines - 6,
      row = 2,
      col = columns - width - 2,
      border = "solid",
      title = " Terminal ",
      title_pos = "left",
      style = "minimal",
    }
  else
    vim.notify("Modo de terminal inválido: " .. mode, vim.log.levels.ERROR)
    return
  end

  -- Crear buffer y ventana
  local buffer = vim.api.nvim_create_buf(true, false)
  local window = vim.api.nvim_open_win(buffer, true, config)

  -- Highlight
  vim.api.nvim_win_set_option(window, "winhighlight", "FloatTitle:HarpoonTitle,FloatBorder:NormalFloat")

  -- Keymap de cierre
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(window) then
      vim.api.nvim_win_close(window, true)
    end
    if vim.api.nvim_buf_is_valid(buffer) then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end, { buffer = buffer })

  -- Terminal
  vim.api.nvim_buf_set_option(buffer, "filetype", "terminal")
  vim.api.nvim_feedkeys("i", "n", true)
  if command == "" then
    vim.fn.termopen(vim.o.shell)
  else
    vim.fn.termopen { vim.o.shell, "-c", command }
  end
end

vim.api.nvim_create_user_command("Terminal", function(args)
  local mode = args.fargs[1] or "horizontal"
  local command = table.concat(args.fargs, " ", 2)

  open_floating_terminal {
    mode = mode,
    command = command ~= "" and command or vim.o.shell,
  }
end, {
  desc = "Floating terminal (horizontal | vertical)",
  nargs = "*",
  complete = function()
    return { "horizontal", "vertical" }
  end,
})
