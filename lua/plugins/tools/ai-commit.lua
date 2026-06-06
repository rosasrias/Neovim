return {
  "vernette/ai-commit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("ai-commit").setup {
      openrouter_api_key = "",
      model = "poolside/laguna-m.1:free",
      auto_push = false,
    }
  end,
}
