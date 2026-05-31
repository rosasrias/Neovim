return {
  "vernette/ai-commit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("ai-commit").setup {
      openrouter_api_key = "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",
      model = "poolside/laguna-m.1:free",
      auto_push = false,
    }
  end,
}
