return {
  "mason-org/mason.nvim",
  lazy = false,
  cmd = { "Mason", "MasonInstall", "MasonUpdate" }, -- Lazy-load on these commands
  dependencies = {
    "mason-org/mason-lspconfig.nvim", -- Official LSP config extension
    "neovim/nvim-lspconfig", -- Base LSP configuration
  },
  opts = {
    -- UI configuration
    ui = {
      icons = {
        package_pending = " ", -- Pending installation
        package_installed = " ", -- Successfully installed
        package_uninstalled = " ", -- Not installed
      },
      -- Key mappings for interactive UI
      keymaps = {
        toggle_server_expand = "<CR>", -- Expand/collapse server details
        install_server = "i", -- Install selected server
        update_server = "u", -- Update server
        check_server_version = "c", -- Check for version updates
        update_all_servers = "U", -- Update all servers
        check_outdated_servers = "C", -- Check for outdated servers
        uninstall_server = "X", -- Uninstall server
        cancel_installation = "<C-c>", -- Cancel current operation
      },
    },
    -- Performance configuration
    max_concurrent_installers = 4, -- Recommended: 4 parallel installs
  },
  config = function(_, opts)
    -- Setup Mason core
    require("mason").setup(opts)

    -- Configure LSP servers integration
    require("mason-lspconfig").setup {
      -- Auto-install essential language servers
      ensure_installed = {
        "lua_ls", -- Lua
        --"ts_ls", -- TypeScript/JavaScript (corrected from ts_ls)
        "html", -- HTML
        "cssls", -- CSS
        "emmet_ls", -- Emmet abbreviations
        "pyright", -- Python
        "clangd", -- C/C++
        "omnisharp", -- C#
        -- Optional servers:
        -- "bashls",     -- Bash
        -- "jsonls",     -- JSON
        -- "yamlls",     -- YAML
      },
      -- Automatic server setup for installed LSPs
      automatic_installation = true,
    }
  end,
}
