return {
  "vernette/ai-commit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("ai-commit").setup({
      openrouter_api_key = "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",
      model = "qwen/qwen-2.5-72b-instruct:free",
      auto_push = false,
    })
  end
}
