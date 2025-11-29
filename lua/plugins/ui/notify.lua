return {
  "rcarriga/nvim-notify",
  event = "VeryLazy", -- carga en idle, no bloquea startup
  opts = function()
    return {
      -- Niveles de notificación
      level = vim.log.levels.INFO,
      minimum_width = 50,
      max_width = 80,
      max_height = 10,

      -- Animación y render
      render = "compact",
      stages = "slide",
      timeout = 3000,
      fps = 30,
      top_down = true,

      -- Visual
      background_colour = "#1e1e2e",
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "󱑆",
      },

      -- Advanced presets
      presets = {
        lsp = {
          timeout = 1500,
          background_colour = "#1e1e2e",
          icon = " ",
        },
        diagnostics = {
          timeout = 2500,
          background_colour = "#1e1e2e",
          icon = " ",
        },
      },
    }
  end,
  config = function(_, opts)
    local notify = require "notify"
    notify.setup(opts)
  end,
}
