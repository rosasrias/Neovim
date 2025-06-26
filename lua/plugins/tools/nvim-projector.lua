return {
	"kndndrj/nvim-projector",
	dependencies = {
		{ "MunifTanjim/nui.nvim", lazy = true },
		{ "kndndrj/projector-neotest", lazy = true },
		{ "nvim-neotest/neotest", lazy = true },
	},
	cmd = { "Projector", "ProjectorRun", "ProjectorDebug" },
	keys = {
		{ "<leader>pp", "<cmd>Projector<cr>", desc = "Open Projector" },
		{ "<leader>pr", "<cmd>ProjectorRun<cr>", desc = "Run Projector" },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "NeotestStarted",
			callback = function()
				require("projector").setup()
			end,
			once = true,
		})
	end,
	config = function()
		require("projector").setup()
	end,
}
