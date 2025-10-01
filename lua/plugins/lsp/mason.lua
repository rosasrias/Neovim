return {
  "mason-org/mason.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- carga antes de que el buffer se use
  cmd = { "Mason", "MasonInstall", "MasonUpdate" }, -- sigue lazy en estos comandos
  dependencies = {
    "mason-org/mason-lspconfig.nvim", -- Extensión oficial LSP
    "neovim/nvim-lspconfig", -- Config base de LSP
  },
  opts = {
    ui = {
      icons = {
        package_pending = " ", -- Pending
        package_installed = " ", -- Installed
        package_uninstalled = " ", -- Not installed
      },
      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
      },
    },
    max_concurrent_installers = 4,
  },
  config = function(_, opts)
    require("mason").setup(opts)

    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "emmet_ls",
        "pyright",
        "clangd",
        "omnisharp",
        -- extras opcionales:
        -- "bashls",
        -- "jsonls",
        -- "yamlls",
      },
      automatic_installation = true,
      automatic_enable = true,
    }
  end,
}
