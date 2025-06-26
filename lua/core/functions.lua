local function notify(message, level, options)
	vim.notify(message, level or vim.log.levels.INFO, options)
end

local function substitute(cmd)
	return cmd:gsub("%%", vim.fn.expand("%"))
		:gsub("$fileBase", vim.fn.expand("%:r"))
		:gsub("$filePath", vim.fn.expand("%:p"))
		:gsub("$file", vim.fn.expand("%"))
		:gsub("$dir", vim.fn.expand("%:p:h"))
		:gsub("#", vim.fn.expand("#"))
		:gsub("$altFile", vim.fn.expand("#"))
end

local function toggle_option(option)
	local value = not vim.api.nvim_get_option_value(option, {})
	vim.opt[option] = value
	notify(option .. " set to " .. tostring(value))
end

local function toggle_tabline()
	local value = vim.api.nvim_get_option_value("showtabline", {})
	value = value == 2 and 0 or 2
	vim.opt.showtabline = value
	notify("showtabline set to " .. tostring(value))
end

local function build_run()
	local file_extension = vim.fn.expand("%:e")
	local term_cmd = "bot 10 new | term "

	-- Table of action for each language
	local actions = {
		c = {
			run = "$fileBase",
			compile = "gcc % -o $fileBase",
			compile_and_run = "gcc % -o $fileBase && $fileBase",
			debug = function()
				require("dap").continue()
				require("dapui").open()
			end,
		},
		cpp = {
			run = "$fileBase",
			compile = "g++ % -o $fileBase",
			compile_and_run = "g++ % -o $fileBase && $fileBase",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		py = {
			run = "python %",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		js = {
			run = "node %",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		php = {
			run = "php %",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		java = {
			compile = "javac %",
			run = "java $fileBase",
			compile_and_run = "javac % && java $fileBase",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		cs = {
			compile = "mcs %", -- Mono C# compiler
			run = "mono $fileBase.exe",
			compile_and_run = "mcs % && mono $fileBase.exe",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		sh = {
			run = "bash %",
			debug = function()
				print("Debugging shell scripts is not supported.")
			end,
		},
		rb = {
			run = "ruby %",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		go = {
			run = "go run %",
			compile = "go build %",
			compile_and_run = "go run %",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		rust = {
			compile = "cargo build",
			run = "cargo run",
			compile_and_run = "cargo run",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		kotlin = {
			compile = "kotlinc % -include-runtime -d $fileBase.jar",
			run = "java -jar $fileBase.jar",
			compile_and_run = "kotlinc % -include-runtime -d $fileBase.jar && java -jar $fileBase.jar",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		ts = {
			compile = "tsc %",
			run = "ts-node %",
			compile_and_run = "tsc % && node $fileBase.js",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		swift = {
			compile = "swiftc % -o $fileBase",
			run = "./$fileBase",
			compile_and_run = "swiftc % -o $fileBase && ./$fileBase",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		zig = {
			compile = "zig build-exe %",
			run = "./$fileBase",
			compile_and_run = "zig build-exe % && ./$fileBase",
			debug = function()
				require("dap").continue()
				require("dapui").toggle()
			end,
		},
		tex = {
			compile = "!pdflatex $fileBase",
			run = "!pdflatex $fileBase",
			compile_and_run = "!pdflatex $fileBase",
		},
	}

	local function execute_command(cmd)
		if type(cmd) == "string" then
			vim.cmd(term_cmd .. substitute(cmd))
		elseif type(cmd) == "function" then
			local ok, err = pcall(cmd)
			if not ok then
				notify("Error en depuración: " .. err, vim.log.levels.ERROR)
			end
		end
	end

	if not actions[file_extension] then
		notify("Lenguaje no soportado", vim.log.levels.WARN, { title = "Ejecutor" })
		return
	end

	vim.ui.select(vim.tbl_keys(actions[file_extension]), {
		prompt = "Acciones disponibles:",
		format_item = function(item)
			local icons = {
				run = " ",
				compile = " ",
				compile_and_run = " ",
				debug = " ",
			}

			return icons[item] .. " " .. item:gsub("_", " "):gsub("^%l", string.upper)
		end,
	}, function(option)
		if option then
			local action = actions[file_extension][option]

			-- For debugging, check dependencies
			if option == "debug" then
				if not pcall(require, "dap") then
					notify("nvim-dap no está instalado", vim.log.levels.ERROR)
					return
				end

				-- Run pre-build if necessary
				if actions[file_extension].compile then
					execute_command(actions[file_extension].compile)
				end
			end
			execute_command(action)
		end
	end)
end

local function lazygit_toggle()
	local lazygit = require("toggleterm.terminal").Terminal:new({
		cmd = "lazygit",
		dir = "git_dir",
		direction = "float",
		float_opts = { border = "rounded" },
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
	})
	lazygit:toggle()
end

local function ranger_toggle()
	if vim.fn.executable("ranger") == 0 then
		notify("ranger isn't installed")
		return
	end

	local ranger = require("toggleterm.terminal").Terminal:new({
		cmd = "ranger",
		direction = "float",
		on_open = function(term)
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
	})
	ranger:toggle()
end

local M = {}

M.toggle_option = toggle_option
M.toggle_tabline = toggle_tabline
M.build_run = build_run
M.lazygit_toggle = lazygit_toggle
M.ranger_toggle = ranger_toggle

return M
