return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- Usa la última versión
	build = ":TSUpdate", -- Mejor comando de construcción
	event = { "BufReadPost", "BufNewFile" }, -- Cargar cuando se abra un archivo
	cmd = {
		"TSInstall",
		"TSInstallInfo",
		"TSUpdate",
		"TSBufEnable",
		"TSBufDisable",
		"TSModuleInfo",
	},
	keys = { -- Keymaps recomendados
		{ "<leader>ts", "<cmd>TSInstallInfo<cr>", desc = "[T]ree[S]itter Info" },
	},
	opts = {
		-- Lenguajes a instalar
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

		sync_install = false, -- Instalación asíncrona recomendada
		auto_install = true, -- Auto-instalar parsers faltantes

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false, -- Desactivar regex legacy
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
			disable = { "python" }, -- Python tiene problemas con la indentación en Treesitter
		},

		-- Configuración de textobjects
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
		-- Pequeño retraso para mejorar el rendimiento en el inicio
		vim.defer_fn(function()
			require("nvim-treesitter.configs").setup(opts)
		end, 0)
	end,

	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			event = "VeryLazy",
		},
	},
}
