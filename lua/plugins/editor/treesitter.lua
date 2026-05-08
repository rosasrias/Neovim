return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",

      "c",
      "cpp",

      "javascript",
      "typescript",
      "tsx",

      "html",
      "css",
      "json",
      "bash",
      "python",
    },
  },

  config = function(_, opts)
    local ts = require("nvim-treesitter")
    ts.install(opts.ensure_installed)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
        vim.bo[args.buf].syntax = "off"
      end,
    })
  end,
}
