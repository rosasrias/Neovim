return {
	"windwp/nvim-autopairs",
	event = "InsertEnter", -- Load when entering insert mode
	dependencies = { "hrsh7th/nvim-cmp" }, -- Declare cmp dependency
	opts = {
		-- Enable fast wrap with default keymap
		fast_wrap = {
			map = "<M-e>", -- Alt+e or Meta+e
			chars = { "{", "[", "(", '"', "'" },
			pattern = [=[[%'%"%>%]%)%}%,]]=],
			end_key = "$",
			check_comma = true,
			highlight = "Search",
			highlight_grey = "Comment",
		},

		-- Filetypes to disable autopairs
		disable_filetype = { "TelescopePrompt", "vim", "NvimTree" },

		-- Treesitter integration (requires nvim-treesitter)
		check_ts = true,

		-- Configuration defaults
		enable_check_bracket_line = false, -- Don't check brackets on same line
		ignored_next_char = "[%w%.]", -- Ignore alphanumeric and . after pair
	},
	config = function(_, opts)
		require("nvim-autopairs").setup(opts)

		-- Integrate with cmp if available
		local cmp_ok, cmp = pcall(require, "cmp")
		if cmp_ok then
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end
	end,
}
