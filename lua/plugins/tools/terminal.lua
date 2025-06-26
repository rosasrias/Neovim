return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- Carga bajo demanda con comandos o keymaps
	cmd = { "ToggleTerm", "TermExec" },
	keys = {
		{
			"<C-\\>",
			"<cmd>ToggleTerm<cr>",
			mode = { "n", "t", "i" },
			desc = "Toggle terminal",
		},
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal terminal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical terminal" },
		{
			"<leader>gg",
			function()
				require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle()
			end,
			desc = "LazyGit",
		},
	},
	opts = {
		size = function(term)
			return term.direction == "horizontal" and math.floor(vim.o.lines * 0.4) or math.floor(vim.o.columns * 0.5)
		end,
		open_mapping = false, -- Desactivamos el mapeo interno para usar el nuestro
		hide_numbers = true,
		shade_terminals = false,
		insert_mappings = true,
		persist_size = true,
		persist_mode = true,
		close_on_exit = true,
		autochdir = true,
		shell = "pwsh", -- vim.o.shell,
		direction = "horizontal",
		start_in_insert = true,
		auto_scroll = true,

		highlights = {
			NormalFloat = { link = "Normal" },
			FloatBorder = { link = "FloatBorder" },
		},

		float_opts = {
			border = "rounded",
			width = math.ceil(vim.o.columns * 0.8),
			height = math.ceil(vim.o.lines * 0.8),
			winblend = 0,
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Configuración avanzada para terminales específicos
		local lazygit = require("toggleterm.terminal").Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			hidden = true,
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<esc>",
					"<cmd>close<CR>",
					{ noremap = true, silent = true }
				)
			end,
			on_close = function(_)
				vim.cmd("startinsert!")
			end,
		})

		-- Mapeo mejorado para LazyGit
		vim.keymap.set("n", "<leader>gg", function()
			lazygit:toggle()
		end, { desc = "[G]it [G]UI (LazyGit)" })

		-- Función para terminales personalizados
		function _G.run_command_in_term(cmd)
			local default_opts = { direction = "float", hidden = true }
			local term = require("toggleterm.terminal").Terminal:new(
				vim.tbl_extend("force", default_opts, opts or {}, { cmd = cmd })
			)
			term:toggle()
			return term
		end
	end,
}
