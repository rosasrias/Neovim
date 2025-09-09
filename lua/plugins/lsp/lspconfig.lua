return {
	"neovim/nvim-lspconfig",
	dependencies = { "MunifTanjim/nui.nvim" },
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
	config = function()
		local lspconfig = require("lspconfig")
		local map = vim.keymap.set

		local M = {}

		M.on_init = function(client, _)
			if vim.fn.has("nvim-0.11") ~= 1 then
				if client.supports_method("textDocument/semanticTokens") then
					client.server_capabilities.semanticTokensProvider = nil
				end
			else
				if client:supports_method("textDocument/semanticTokens") then
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
				{
					"n",
					"<leader>D",
					vim.lsp.buf.type_definition,
					"Go to type definition",
				},
				{ "n", "<leader>ra", require("plugins.lsp.extra.renamer"), "Renamer" },
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

		vim.diagnostic.config({
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			signs = { text = { [1] = " ", [2] = " ", [3] = " ", [4] = "󰌵" } },
			float = {
				suffix = "",
				header = { "  Diagnostics", "String" },
				prefix = function(_, _, _)
					return " 󰶻 ", "String"
				end,
			},
		})

		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		local function custom_open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = vim.g.transparency and "rounded" or "solid"
			opts.scrollbar = false
			table.insert(contents, 1, " ")
			table.insert(contents, " ")
			for i, line in ipairs(contents) do
				contents[i] = "  " .. line .. "  "
			end

			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end
		vim.lsp.util.open_floating_preview = custom_open_floating_preview

		local servers = {
			"jdtls",
			"html",
			"pyright",
			"ts_ls",
			"clangd",
			"cssls",
			"texlab",
			"jsonls",
			"tailwindcss",
			"yamlls",
			"texlab",
			"marksman",
			"taplo",
			"csharp_ls",
			"taplo",
		}

		for _, k in ipairs(servers) do
			lspconfig[k].setup({
				on_attach = M.on_attach,
				on_init = M.on_init,
				capabilities = M.capabilities,
			})
		end

		lspconfig.lua_ls.setup({
			on_attach = M.on_attach,
			on_init = M.on_init,
			capabilities = M.capabilities,

			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
					},
				},
			},
		})

		lspconfig.emmet_ls.setup({
			on_attach = function(client, bufnr)
				M.on_attach(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			capabilities = M.capabilities,
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
				"php",
				"twig",
			},
			initialize_options = {
				html = {
					options = {
						["bem.enabled"] = true,
					},
				},
				php = {
					options = {
						["bem.enabled"] = true,
					},
				},
			},
		})

		lspconfig.intelephense.setup({
			on_attach = M.on_attach,
			capabilities = M.capabilities,
			cmd = { "intelephense", "--stdio" },
			root_dir = lspconfig.util.root_pattern("composer.json", ".git", "index.php", "public"),
			filetypes = { "php" },
		})

		-- lspconfig.omnisharp.setup({
		-- 	on_init = M.on_init,
		-- 	on_attach = M.on_attach,
		-- 	capabilities = M.capabilities,
		-- 	enable_import_completion = true,
		-- 	organize_imports_on_format = true,
		-- 	enable_roslyn_analyzers = false,
		-- 	settings = {
		-- 		FormattingOptions = {
		-- 			EnableEditorConfigSupport = true,
		-- 		},
		-- 		-- Configuraciones específicas para Unity:
		-- 		RoslynExtensionsOptions = {
		-- 			EnableAnalyzersSupport = false,
		-- 			EnableDecompilationSupport = true,
		-- 			EnableImportCompletion = true,
		-- 		},
		-- 		Sdk = {
		-- 			IncludePrereleases = true,
		-- 		},
		-- 		MsBuild = {
		-- 			-- Ruta al MSBuild de Unity (ajusta según tu instalación)
		-- 			MSBuildPath = "C:/Program Files/Unity/Hub/Editor/6000.1.5f1/Editor/Data/Tools/MSBuild",
		-- 			UseLegacySdkResolver = true,
		-- 		},
		-- 	},
		-- 	cmd = {
		-- 		"omnisharp",
		-- 		"--languageserver",
		-- 		"--hostPID",
		-- 		tostring(vim.fn.getpid()),
		-- 	},
		-- 	root_dir = function(fname)
		-- 		return lspconfig.util.root_pattern("*.sln", "*.csproj", "ProjectSettings", "Assets")(fname)
		-- 			or vim.fn.getcwd()
		-- 	end,
		-- })

		-- lspconfig.sqlls.setup({
		-- 	on_attach = M.on_attach,
		-- 	capabilities = M.capabilities,
		-- 	filetypes = { "sql", "mysql" },
		-- 	root_dir = function()
		-- 		return vim.fn.getcwd()
		-- 	end,
		-- 	settings = {
		-- 		sqlLanguageServer = {
		-- 			connections = {
		-- 				{
		-- 					driver = "mysql",
		-- 					dataSourceName = "root:password@tcp(localhost:3306)/phpmyadmin",
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
		return M
	end,
}
