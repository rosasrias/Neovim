return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  keys = {
    { "<leader>ks", desc = "Kulala Send request" },
    { "<leader>ka", desc = "Kulala Send all requests" },
    { "<leader>kb", desc = "Kulala Scratchpad" },
  },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = "<leader>k",
    kulala_keymaps_prefix = "",
    lsp = { enable = true },
  },
}
