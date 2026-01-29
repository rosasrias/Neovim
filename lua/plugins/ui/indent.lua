return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>ti", "<cmd>IBLToggle<cr>", desc = "[T]oggle [I]ndent Lines" },
  },
  opts = {
    indent = {
      char = "│",
      highlight = "IblChar",
      priority = 1,
    },
    scope = {
      enabled = false,
      char = "│",
      highlight = "IblScopeChar",
      priority = 2,
      show_start = true,
      show_end = true,
    },
    exclude = {
      filetypes = {
        "help",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "txt",
        "markdown",
        "NvimTree",
      },
    },
    whitespace = {
      remove_blankline_trail = true,
    },
  },
  config = function(_, opts)
    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    require("ibl").setup(opts)
  end,
}
