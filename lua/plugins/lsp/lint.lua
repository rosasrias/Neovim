return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      -- 🌐 Frontend / Backend JS/TS
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },

      -- 🐍 Python
      python = { "ruff" }, -- alternativo: "flake8" o "pylint"

      -- 🦀 Rust
      rust = { "clippy" },

      -- ⚙️ C / C++
      c = { "clangtidy" },
      cpp = { "clangtidy" },

      -- ☕ Java
      java = { "checkstyle" },

      -- 🐘 PHP
      php = { "phpstan" },

      -- 🐹 Go
      go = { "golangcilint" },

      -- 🔧 Otros si querés sumar
      lua = { "luacheck" },
      yaml = { "yamllint" },
    }

    -- Auto lint en guardar o al salir del insert
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
