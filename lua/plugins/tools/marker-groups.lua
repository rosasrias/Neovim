return {
  "jameswolensky/marker-groups.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Requerido
    "nvim-telescope/telescope.nvim", -- Optional: fuzzy search
  },
  cmd = { "MarkerAdd", "MarkerList", "MarkerClear" },
  keys = {
    { "<leader>ma", "<cmd>MarkerAdd<cr>", desc = "Add marker" },
    { "<leader>ml", "<cmd>MarkerList<cr>", desc = "List markers" },
    { "<leader>mc", "<cmd>MarkerClear<cr>", desc = "Clear markers" },
  },
  config = true,
}
