return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
		lazy = true,
	},
	cmd = { "DBee" },
	ft = { "sql" },
	keys = {
		{ "<leader>d", "<cmd>DBee<cr>", desc = "Open DBee" },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "DBeeStarted",
			callback = function()
				require("projector").setup()
			end,
			once = true,
		})
	end,
	build = function()
		require("dbee").install()
	end,
	opts = {},
}
