return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      tsserver_plugins = {
        "typescript-styled-plugin",
      },
    },
  },
}
