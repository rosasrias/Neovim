return {
	"folke/which-key.nvim",
	keys = "<leader>",
	init = function()
		-- Setup timeout before showing popup (moved from config to init)
		vim.o.timeout = true
		vim.o.timeoutlen = 301
	end,
	opts = {
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 21,
			},
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		layout = {
			height = { min = 5, max = 25 },
			width = { min = 21, max = 50 },
			spacing = 4,
			align = "left",
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Register key mappings
		wk.add({
			{ "<leader>f", group = "file" },
		})
	end,
}
