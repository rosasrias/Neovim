return {
  "nvim-treesitter/nvim-treesitter",
  version = "*", -- Último release estable
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "TSInstall",
    "TSInstallInfo",
    "TSUpdate",
    "TSBufEnable",
    "TSBufDisable",
    "TSModuleInfo",
  },
  keys = {
    { "<leader>ts", "<cmd>TSInstallInfo<cr>", desc = "[T]ree[S]itter Info" },
  },
  opts = {
    ensure_installed = {
      "python",
      "luadoc",
      "javascript",
      "typescript",
      "lua",
      "bash",
      "json",
      "yaml",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
      "query",
      "regex",
      "html",
      "css",
      "toml",
      "dockerfile",
    },
    sync_install = false,
    auto_install = false, -- más controlado
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        return ok and stats and stats.size > max_filesize
      end,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = true,
      disable = { "python" },
    },
    textobjects = {
      select = {
        enable = false,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
        },
      },
    },
  },
  config = function(_, opts)
    vim.defer_fn(function()
      require("nvim-treesitter.configs").setup(opts)
    end, 0)
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}
