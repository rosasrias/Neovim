local custom_autocmd_group = vim.api.nvim_create_augroup("CustomAutocmdGroup", { clear = true })

--- Check if a path is a directory
---@param path string
---@return boolean
local function is_directory(path)
	return vim.fn.isdirectory(path) == 1
end

local function reload_neovim_config()
	local file_path = vim.fn.expand("%:p")
	local app_name = vim.env.NVIM_APPNAME or "nvim"
	local module = file_path:match("^.*/" .. app_name .. "/lua/(.+).lua$"):gsub("/", ".")

	vim.cmd("silent! source " .. file_path)

	require("themes").load_all_highlights()
	require("plenary.reload").reload_module(module)
end

-- Open nvim-tree when entering a directory
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function(data)
		if is_directory(data.file) then
			vim.cmd.cd(data.file)
			require("nvim-tree.api").tree.open()
		end
	end,
	desc = "Open nvim-tree when entering a directory",
})

-- Show floating diagnostics when cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float({ scope = "cursor", focusable = false })
	end,
	desc = "Show LSP diagnostics on hover",
})

-- Highlight text yanked
vim.api.nvim_create_autocmd("TextYankPost", {
	group = custom_autocmd_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight copied text",
})

-- Close specific windows with 'q'
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = custom_autocmd_group,
	callback = function()
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
		if vim.tbl_contains({ "help", "nofile", "quickfix" }, buftype) and vim.fn.maparg("q", "n") == "" then
			vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>close<cr>", { silent = true, noremap = true })
		end
	end,
	desc = "Close help windows, quickfix, etc. with 'q'",
})

-- Configure quickfix buffer so that it is not modifiable
vim.api.nvim_create_autocmd("FileType", {
	group = custom_autocmd_group,
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
	desc = "Don't list quickfix buffers",
})

-- Desactivate line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
	desc = "Disable line numbers in terminal buffers",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = custom_autocmd_group,
	pattern = vim.fn.stdpath("config") .. "/lua/*.lua",
	callback = reload_neovim_config,
	desc = "Reload config when it is saved",
})

vim.api.nvim_create_user_command("Ranger", function()
	require("core.functions").ranger_toggle()
end, { desc = "Open/Toggle Ranger" })
