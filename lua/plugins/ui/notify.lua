return {
  "rcarriga/nvim-notify",
  event = "VeryLazy", -- carga en idle, no bloquea startup
  opts = function()
    return {
      -- Niveles de notificación
      level = vim.log.levels.INFO,
      minimum_width = 50,
      max_width = 70,
      max_height = 8,

      -- Animación y render
      render = "wrapped-compact",
      stages = "slide",
      timeout = 3000,
      fps = 30,
      top_down = true,

      -- Visual
      -- background_colour = "#1e1e2e",
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "󱑆",
      },

      on_open = function(win)
        vim.api.nvim_win_set_option(
          win,
          "winhl",
          table.concat({
            "Normal:NotifyBackground",
            "FloatBorder:NotifyINFOBorder",
          }, ",")
        )
      end,

      on_update = function(win)
        vim.api.nvim_win_set_option(win, "winhl", "Normal:NotifyBackground,FloatBorder:NotifyINFOBorder")
      end,
      -- Advanced presets
      -- presets = {
      --   lsp = {
      --     timeout = 1500,
      --     --background_colour = "#1e1e2e",
      --     icon = " ",
      --   },
      --   diagnostics = {
      --     timeout = 2500,
      --     -- background_colour = "#1e1e2e",
      --     icon = " ",
      --   },
      -- },
    }
  end,
  config = function(_, opts)
    local notify = require "notify"
    notify.setup(opts)
    -- Lazy.nvim / markdown fix
    vim.api.nvim_set_hl(0, "@markup.heading", { link = "NotifyINFOBody" })
    vim.api.nvim_set_hl(0, "@markup.list", { link = "NotifyINFOBody" })
    vim.api.nvim_set_hl(0, "Special", { link = "NotifyINFOBody" })
  end,
}
