return {
  {
    "ellisonleao/dotenv.nvim",
    cmd = { "Dotenv", "DotenvGet" },
    config = function()
      require("dotenv").setup {
        enable_on_load = true,
        verbose = false,
      }
    end,
  },

  {
    "tpope/vim-dadbod",
    cmd = { "DB", "DBUI", "DBUIToggle", "DBUIRefresh" },
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    cmd = { "DBUI", "DBUIToggle" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_win_position = "right"
      vim.g.db_ui_winwidth = 35
      vim.g.db_ui_save_location = vim.fn.stdpath "config" .. "/db_ui"
      vim.g.db_ui_use_nvim_notify = 1
    end,
  },

  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = { "tpope/vim-dadbod" },
    ft = { "sql", "mysql", "plsql" },
  },
}
