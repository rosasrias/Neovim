return {
	"folke/noice.nvim",
	event = { "VeryLazy", "UIEnter" }, -- Carga diferida pero antes de la interfaz
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
			lazy = true, -- Se cargará automáticamente cuando noice lo necesite
		},
		{
			"rcarriga/nvim-notify",
			opts = {
				timeout = 1500,
				render = "compact",
				stages = "fade",
			},
			config = true,
		},
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
			},
		},
		views = {
			cmdline_popup = {
				position = { row = "30%", col = "50%" }, -- Posición más alta
				size = { width = "auto", min_width = 60, height = "auto" },
				border = { style = "rounded", padding = { 0, 1 } },
			},
			hover = {
				border = { style = "rounded", padding = { 0, 1 } },
				position = { row = 2, col = 2 }, -- Mejor posición para hover
			},
		},
		lsp = {
			progress = { enabled = false },
			signature = { enabled = false },
			hover = { enabled = false, silent = true },
			message = {
				enabled = true,
				view = "notify",
				opts = {},
			},
		},
		presets = {
			lsp_doc_border = true,
			inc_rename = true, -- Habilitado para mejor UX
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
			-- Filtro mejorado para mensajes de búsqueda
			{
				filter = {
					event = "msg_show",
					find = "%d+ matches",
				},
				view = "mini",
			},
		},
	},
	config = function(_, opts)
		require("noice").setup(opts)

		-- Keymaps mejorados
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
		end

		map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", "[N]oice [D]ismiss")
		map("n", "<leader>nl", "<cmd>NoiceLast<CR>", "[N]oice [L]ast")
		map("n", "<leader>nh", "<cmd>NoiceHistory<CR>", "[N]oice [H]istory")
		map("n", "<leader>nt", "<cmd>NoiceTelescope<CR>", "[N]oice [T]elescope")

		-- Integración con LSP
		vim.api.nvim_create_autocmd("User", {
			pattern = "LspAttach",
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client then
					-- Personalización para clientes LSP específicos
					if client.name == "tsserver" then
						vim.keymap.set("n", "K", function()
							require("noice.lsp").hover()
						end, { buffer = args.buf, desc = "Hover Documentation" })
					end
				end
			end,
		})
	end,
}
