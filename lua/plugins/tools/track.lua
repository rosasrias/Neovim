return {
  "dharmx/track.nvim",
  cmd = { "Track", "Mark", "Unmark", "OpenMark", "TrackBranches", "TrackViews" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- opcional, pero recomendado
  },
  keys = {
    -- marks
    { "<leader>ma", ":Mark<CR>", desc = "Mark current file" },
    { "<leader>mu", ":Unmark<CR>", desc = "Unmark current file" },
    { "<leader>mo", ":OpenMark<CR>", desc = "Open marked file" },

    -- main pad
    { "<leader>mt", ":Track<CR>", desc = "Open Track pad" },

    -- telescope pickers
    { "<leader>mb", ":Track branches<CR>", desc = "Track: branches" },
    { "<leader>mv", ":Track views<CR>", desc = "Track: views" },
  },
  opts = {
    -- Configuración básica
    storage = "json", -- json file para persistencia
    path = vim.fn.stdpath "data" .. "/track.json", -- dónde guarda
    views = {
      default = { "all" }, -- vista por defecto
    },
  },
}
