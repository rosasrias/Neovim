return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",

  keys = {
    {
      "<C-p>",
      "<cmd>FloatermToggle<CR>",
      mode = { "n", "t" },
      desc = "Toggle Floaterm",
    },
  },

  opts = {
    border = false,
    size = { h = 60, w = 70 },
    mappings = { sidebar = nil, term = nil },
    terminals = {
      { name = "Terminal" },
      { name = "Terminal", cmd = "neofetch" },
    },
  },

  cmd = "FloatermToggle",
}
