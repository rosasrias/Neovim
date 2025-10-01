local M = {}

M.on_init = function(client, _)
  if vim.fn.has "nvim-0.11" ~= 1 then
    if client.supports_method "textDocument/semanticTokens" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  else
    if client:supports_method "textDocument/semanticTokens" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end
end

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true

  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  local map = vim.keymap.set

  require("plugins.lsp.extra.signature").setup(client, bufnr)

  local mappings = {
    { "n", "K", vim.lsp.buf.hover, "Hover" },
    { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
    { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
    { "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
    { "n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
    { "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
    {
      "n",
      "<leader>wl",
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
    { "n", "<leader>D", vim.lsp.buf.type_definition, "Go to type definition" },
    { "n", "<leader>ra", require "plugins.lsp.extra.renamer", "Renamer" },
    { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action" },
    { "n", "gr", vim.lsp.buf.references, "Show references" },
  }

  for _, m in ipairs(mappings) do
    map(m[1], m[2], m[3], opts(m[4]))
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

return M
