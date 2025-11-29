return {
  "stevearc/dressing.nvim",
  config = true,
  event = "VeryLazy",
  opts = {
    border = "solid",
    input = {
      enabled = true,
      border = "solid",
      default_prompt = "Input:",
      title_pos = "center",
    },
    win_options = {
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat,Title:Title",
    },
  },
  init = function()
    vim.ui.select = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      return vim.ui.select(...)
    end
    vim.ui.input = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      return vim.ui.input(...)
    end
  end,
}
