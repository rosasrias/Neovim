return {
	"sindrets/diffview.nvim",
	cmd = { -- Lazy-load on these commands
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewFileHistory",
		"DiffviewRefresh",
	},
	keys = { -- Suggested key mappings (trigger lazy loading)
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "[G]it [D]iff View" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "[G]it [H]istory" },
		{ "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "[G]it Diffview [C]lose" },
		{ "<leader>gr", "<cmd>DiffviewRefresh<cr>", desc = "[G]it Diffview [R]efresh" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim", -- Siempre necesario
		{
			"nvim-tree/nvim-web-devicons",
			lazy = true, -- Ya que solo se necesita para los íconos
		},
		{
			"tpope/vim-fugitive", -- Opcional pero recomendado
			cmd = { "Git", "G" }, -- Carga bajo demanda con comandos de fugitive
			keys = { -- Keymaps específicos para fugitive
				{ "<leader>gs", "<cmd>Git<cr>", desc = "[G]it [S]tatus" },
			},
		},
	},
	opts = {
		view = {
			merge_tool = {
				layout = "diff3_mixed",
			},
		},
		file_history = {
			log_options = {
				single_file = { diff_merges = "combined" },
				multi_file = { diff_merges = "first-parent" },
			},
		},
		enhanced_diff_hl = true,
		show_help_hints = false,
		use_icons = true,
		icons = {
			folder_closed = "",
			folder_open = "",
		},
	},
	config = function(_, opts)
		require("diffview").setup(opts)

		-- Opcional: Configuración adicional para integración con fugitive
		vim.api.nvim_create_autocmd("User", {
			pattern = "DiffviewSetup",
			callback = function()
				-- Personalizaciones adicionales después de cargar diffview
			end,
		})
	end,
}
