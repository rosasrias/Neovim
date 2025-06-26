return {
	"terrortylor/nvim-comment",
	event = "BufReadPost", -- Load after buffer is initialized
	cmd = { "CommentToggle", "CommentLine", "CommentBlock" }, -- Lazy-load on command
	keys = {
		{ "<leader>/", "<cmd>CommentToggle<CR>", desc = "Toggle comment" }, -- Line comment
		{ "<leader>/", mode = "v", "<cmd>CommentToggle<CR>", desc = "Toggle block comment" }, -- Visual mode
	},
	opts = {
		-- Mappings configuration
		line_mapping = "<leader>/", -- Normal mode mapping
		operator_mapping = "<leader>/", -- Operator-pending mapping
		comment_chunk_text_object = "ic", -- Text object for comment chunks

		-- Comment style configuration
		comment_empty = false, -- Disable commenting empty lines
		comment_empty_trim_whitespace = true, -- Trim whitespace in empty comments

		-- Language-specific settings
		hook = function()
			-- Optional: Add custom comment string for specific filetypes
			if vim.bo.filetype == "terraform" then
				return { comment_string = "#" }
			end
		end,

		-- Advanced settings
		marker_padding = true, -- Add space after comment marker
		ignore_blank_line = false, -- Allow commenting blank lines
		create_mappings = true, -- Enable default mappings
	},
	config = function(_, opts)
		require("nvim_comment").setup(opts)

		-- Additional text object mapping
		vim.keymap.set(
			"o",
			"ic",
			"<cmd>lua require('nvim_comment').comment_text_object()<CR>",
			{ desc = "Comment text object" }
		)
	end,
}
