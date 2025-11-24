local ok, jdtls = pcall(require, "jdtls")
if not ok then
  return
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == nil then
  return
end

local jdtls_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls"
local java_debug_path = vim.fn.stdpath "data" .. "/mason/packages/java-debug-adapter"
local java_test_path = vim.fn.stdpath "data" .. "/mason/packages/java-test"
local lombok_path = jdtls_path .. "/lombok.jar"

local equinox_launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

-- Bundles debug + test
local bundles = {
  vim.fn.glob(java_debug_path .. "/extensions/server/com.microsoft.java.debug.plugin-*.jar"),
}

vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n"))

-- Workspace
local workspace_dir = vim.fn.stdpath "data" .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. lombok_path,
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    equinox_launcher,

    "-configuration",
    jdtls_path .. "/config_win",

    "-data",
    workspace_dir,
  },

  root_dir = root_dir,
  on_attach = require("plugins.lsp.lspconfig").on_attach,
  capabilities = require("plugins.lsp.lspconfig").capabilities,

  settings = {
    java = {
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      referenceCodeLens = { enabled = true },
      implementationsCodeLens = { enabled = true },
      signatureHelp = { enabled = true },

      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    },
  },

  init_options = {
    bundles = bundles,
  },
}

-- Keymaps
local buf = vim.api.nvim_get_current_buf()
local map = vim.keymap.set
local opts = { silent = true, buffer = buf }

map("n", "A-o", function()
  jdtls.organize_imports()
end, opts)
map("n", "crv", function()
  jdtls.extract_variable()
end, opts)
map("v", "crv", function()
  jdtls.extract_variable(true)
end, opts)
map("n", "crc", function()
  jdtls.extract_constant()
end, opts)
map("v", "crc", function()
  jdtls.extract_constant(true)
end, opts)
map("v", "crm", function()
  jdtls.extract_method(true)
end, opts)

vim.cmd [[
	command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
	command! -buffer JdtBytecode lua require('jdtls').javap()
	command! -buffer JavaTestCurrentClass lua require('jdtls').test_class()
	command! -buffer JavaTestNearestMethod lua require('jdtls').test_nearest_method()
]]

jdtls.start_or_attach(config)
