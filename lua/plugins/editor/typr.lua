return {
	"nvzone/typr",
	cmd = { "Typr", "TyprStats" }, -- Se cargará cuando se ejecute cualquiera de estos comandos
	keys = { -- También puedes añadir keymaps para cargarlo
		{ "<leader>tt", "<cmd>Typr<cr>", desc = "[T]ypr [T]est" },
		{ "<leader>ts", "<cmd>TyprStats<cr>", desc = "[T]ypr [S]tats" },
	},
	opts = {
		config = {
			winlayout = "responsive",
			kblayout = "qwerty",
			wpm_goal = 120,
			numbers = false,
			symbols = false,
			random = false,
			insert_on_start = false,
			stats_filepath = vim.fn.stdpath("data") .. "/typrstats",
			mappings = nil,
		},
		data = {
			accuracy = 0,
			wpm = 0,
			rawpm = 0,
			correct_word_ratio = "?",
			total_char_count = 0,
			typed_char_count = 0,
			char_times = {},
			char_stats = { all = 0, wrong = 0 },
			word_stats = { all = 0, wrong = 0 },
		},
		tabs = {},
		horiz_i = 1,
	},
	config = function(_, opts)
		require("typr").setup(opts)
	end,
}
