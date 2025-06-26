return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNew" }, -- Load after buffer initialization
	dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
	keys = {
		-- Navigation
		{
			"]h",
			function()
				require("gitsigns").next_hunk()
			end,
			desc = "Next Git Hunk",
		},
		{
			"[h",
			function()
				require("gitsigns").prev_hunk()
			end,
			desc = "Previous Git Hunk",
		},

		-- Actions
		{
			"<leader>hs",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "[H]unk [S]tage",
		},
		{
			"<leader>hr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "[H]unk [R]eset",
		},
		{
			"<leader>hp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "[H]unk [P]review",
		},
		{
			"<leader>hb",
			function()
				require("gitsigns").blame_line()
			end,
			desc = "[H]unk [B]lame",
		},
	},
	opts = {
		-- Sign configuration
		signs = {
			add = { text = "▎" }, -- or '󰐕'
			change = { text = "▎" }, -- or '󰏫'
			delete = { text = "󰍵" },
			topdelete = { text = "󰍴" },
			changedelete = { text = "󱕖" },
			untracked = { text = "▎" }, -- New untracked files
		},

		-- Visual enhancements
		signcolumn = true, -- Always show sign column
		numhl = false, -- Disable line number highlighting
		linehl = false, -- Disable line highlighting
		word_diff = false, -- Disable word diff

		-- Key configurations
		watch_gitdir = { interval = 1000, follow_files = true },
		current_line_blame = true, -- Enable blame in statusline
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- Right align
			delay = 1000,
		},

		-- Preview configurations
		preview_config = {
			border = "rounded", -- Border style
			style = "minimal", -- Preview window style
			relative = "cursor", -- Position relative to cursor
			row = 0, -- Vertical position
			col = 1, -- Horizontal position
		},

		-- Advanced configurations
		update_debounce = 200, -- Update throttling (ms)
		max_file_length = 40000, -- Disable for large files
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)
	end,
}
