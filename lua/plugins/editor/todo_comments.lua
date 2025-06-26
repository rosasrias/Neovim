return {
	"folke/todo-comments.nvim",
	lazy = true,
	cmd = { -- Lazy-load on these commands
		"TodoTrouble",
		"TodoLocList",
		"TodoQuickFix",
		"TodoTelescope",
	},
	keys = { -- Suggested key mappings
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "[F]ind [T]odos" },
		{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo [T]rouble" },
	},
	opts = {
		-- Visual configuration
		signs = true,
		sign_priority = 8,
		gui_style = {
			fg = "NONE", -- No special foreground styling
			bg = "NONE", -- No background highlight
		},

		-- Keyword definitions
		keywords = {
			FIX = {
				icon = " ",
				color = "error",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = {
				icon = " ",
				color = "warning",
				alt = { "WARNING", "XXX" },
			},
			PERF = {
				icon = " ",
				alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
			},
			NOTE = {
				icon = " ",
				color = "hint",
				alt = { "INFO" },
			},
			TEST = {
				icon = "⏲ ",
				color = "test",
				alt = { "TESTING", "PASSED", "FAILED" },
			},
		},

		-- Highlight configuration
		highlight = {
			multiline = true, -- Enable multi-line todo detection
			multiline_pattern = "^.", -- Pattern for multi-line matching
			multiline_context = 10, -- Lines to re-evaluate on change
			keyword = "wide_bg", -- Highlight style for keywords
			after = "fg", -- Highlight text after keyword
			comments_only = true, -- Only search in comments
			max_line_len = 400, -- Ignore long lines
			exclude = { -- Filetypes to exclude
				"gitcommit",
				"help",
				"markdown",
			},
		},

		-- Color definitions
		colors = {
			error = { "DiagnosticError", "#DC2626" },
			warning = { "DiagnosticWarn", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
			test = { "Special", "#FF00FF" },
		},

		-- Search configuration
		search = {
			command = "rg", -- Use ripgrep
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--hidden",
				"--glob=!.git/",
			},
			pattern = [[\b(KEYWORDS)(:| )]], -- Match keywords with colon or space
		},
	},
	config = function(_, opts)
		require("todo-comments").setup(opts)

		-- Optional: Auto-open trouble list when searching todos
		vim.api.nvim_create_autocmd("User", {
			pattern = "TodoTroubleRefresh",
			callback = function()
				vim.cmd.Trouble("document_diagnostics")
			end,
		})
	end,
}
