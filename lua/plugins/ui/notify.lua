return {
	"rcarriga/nvim-notify",
	event = "VeryLazy", -- Load on first notification
	opts = {
		-- Notification levels
		level = vim.log.levels.INFO, -- Default notification level
		minimum_width = 50, -- Minimum notification width
		max_width = 80, -- Maximum notification width
		max_height = 10, -- Maximum number of lines

		-- Animation and rendering
		render = "compact", -- Render style: default, minimal, compact
		stages = "slide", -- Animation style: fade, slide, static
		timeout = 3000, -- Default timeout in milliseconds
		fps = 30, -- Animation frames per second
		top_down = true, -- Display notifications top-down

		-- Visual customization
		background_colour = "#1e1e2e", -- Background color (match your theme)
		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
			TRACE = "",
		},

		-- Window configuration
		on_open = nil, -- Callback when window opens
		on_close = nil, -- Callback when window closes

		-- Advanced configuration
		replace = false, -- Replace existing notifications
		merge = false, -- Merge identical notifications
		hide_from_history = false, -- Hide from notification history
		force = false, -- Force notifications even if disabled
	},
	config = function(_, opts)
		local notify = require("notify")

		-- Override vim.notify
		vim.notify = notify

		-- Setup with configuration
		notify.setup(opts)

		-- Custom notification presets
		notify.setup({
			presets = {
				lsp = {
					timeout = 1500,
					background_colour = "#1e1e2e",
					icon = " ",
				},
				diagnostics = {
					timeout = 2500,
					background_colour = "#1e1e2e",
					icon = " ",
				},
			},
		})

		-- Example: Custom notification function
		local function custom_notify(message, level)
			opts = vim.tbl_extend("force", {
				title = "Custom Notification",
				icon = " ",
				on_open = function(win)
					local buf = vim.api.nvim_win_get_buf(win)
					vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
				end,
			}, opts or {})

			notify(message, level, opts)
		end

		-- Example usage
		vim.keymap.set("n", "<leader>nn", function()
			custom_notify("This is a custom notification!", vim.log.levels.INFO)
		end, { desc = "[N]otification [N]ew" })
	end,
}
