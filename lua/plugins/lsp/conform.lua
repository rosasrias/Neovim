return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  lazy = true,
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format()
      end,
      desc = "[C]ode [F]ormat",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "biome" },
      html = { "biome" },
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      yaml = { "yamlfix" },
      markdown = { "mdformat" },
      c_sharp = { "csharpier" },
      xml = { "xmlformatter" },
      python = { "black" },
      rust = { "rustfmt" },
      proto = { "prettier" },
      java = { "google-java-format" },
      latex = { "latexindent" },
      cpp = { "clang-format" },
      c = { "clang-format" },
      php = { "php-cs-fixer" },
      toml = { "taplo" },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
      async = false,
    },

    formatters = {
      biome = {
        command = "biome",
        args = { "format", "--stdin-file-path", "$FILENAME" },
      },
      prettier = {
        prepend_args = { "--prose-wrap", "always" },
      },
      clang_format = {
        cwd = function(ctx)
          return require("conform").get_root(ctx, {
            root_files = { ".clang-format", ".clang-format.json", "CMakeLists.txt" },
          })
        end,
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        require("conform").format { bufnr = args.buf }
      end,
    })
  end,
}
