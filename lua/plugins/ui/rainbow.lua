return {
  "HiPhish/rainbow-delimiters.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>rt", "<cmd>RainbowToggle<cr>", desc = "[R]ainbow [T]oggle" },
  },
  opts = function()
    return {
      strategy = {
        [""] = require("rainbow-delimiters").strategy["global"],
        vim = require("rainbow-delimiters").strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        python = "rainbow-parens",
        javascript = "rainbow-delimiters-react",
      },
      priority = {
        [""] = 110,
        lua = 210,
        python = 200,
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
     max_file_lines = 3000,
    }
  end,
  config = function(_, opts)
    vim.g.rainbow_delimiter = opts
  end
}
