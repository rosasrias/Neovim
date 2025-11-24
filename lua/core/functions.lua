---------------------------------------------------------
-- Icons
---------------------------------------------------------
local ICONS = {
  RUN = " ",
  BUILD = "󱤵 ",
  JAVA = " ",
}

---------------------------------------------------------
-- Notify wrapper
---------------------------------------------------------
local function notify(msg, level)
  vim.notify(msg, level or vim.log.levels.INFO)
end

---------------------------------------------------------
-- Variable substitution
---------------------------------------------------------
local function substitute(cmd)
  return cmd
    :gsub("%%", vim.fn.expand "%")
    :gsub("$fileBase", vim.fn.expand "%:r")
    :gsub("$filePath", vim.fn.expand "%:p")
    :gsub("$file", vim.fn.expand "%")
    :gsub("$dir", vim.fn.expand "%:p:h")
    :gsub("#", vim.fn.expand "#")
    :gsub("$altFile", vim.fn.expand "#")
end

---------------------------------------------------------
-- Detect shell (Bash / PS)
---------------------------------------------------------
local function wrap_command(cmd)
  if vim.fn.has "win32" == 1 then
    if cmd:match "&&" then
      local parts = vim.split(cmd, "&&")
      local first = vim.trim(parts[1])
      local second = vim.trim(parts[2])
      cmd = string.format("%s; if ($?) { %s }", first, second)
    end
    return { "powershell", "-NoLogo", "-NoProfile", "-Command", cmd }
  end

  return { "bash", "-lc", cmd }
end

---------------------------------------------------------
-- Floating terminal (bottom)
---------------------------------------------------------
local function open_floating_terminal(cmd)
  local command = wrap_command(cmd)
  local height = math.floor(vim.o.lines * 0.3)

  local nvimtree_width = 0
  local ok, view = pcall(require, "nvim-tree.view")
  if ok and view.is_visible() then
    nvimtree_width = view.View.width
  end

  local width = vim.o.columns - nvimtree_width
  local bottom_padding = 3

  local config = {
    relative = "editor",
    width = width,
    height = height,
    border = "solid",
    title = " Terminal ",
    title_pos = "left",
    style = "minimal",
    row = vim.o.lines - height - bottom_padding,
    col = nvimtree_width,
  }

  local buffer = vim.api.nvim_create_buf(true, false)
  local window = vim.api.nvim_open_win(buffer, true, config)
  vim.api.nvim_win_set_option(window, "winhighlight", "FloatTitle:HarpoonTitle,FloatBorder:NormalFloat")

  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(window) then
      vim.api.nvim_win_close(window, true)
    end
    if vim.api.nvim_buf_is_valid(buffer) then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end, { buffer = buffer })

  vim.api.nvim_buf_set_option(buffer, "filetype", "terminal")
  vim.api.nvim_feedkeys("i", "n", true)
  vim.fn.termopen(command)
end

---------------------------------------------------------
-- Floating centered terminal
---------------------------------------------------------
local function open_centered_terminal(cmd)
  local command = wrap_command(cmd)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  local config = {
    relative = "editor",
    width = width,
    height = height,
    border = "solid",
    title = cmd,
    title_pos = "center",
    style = "minimal",
    row = ((vim.o.lines - height) / 2) - 1,
    col = ((vim.o.columns - width) / 2),
  }

  local buffer = vim.api.nvim_create_buf(true, false)
  local window = vim.api.nvim_open_win(buffer, true, config)
  vim.api.nvim_win_set_option(window, "winhighlight", "FloatTitle:HarpoonTitle,FloatBorder:NormalFloat")

  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(window) then
      vim.api.nvim_win_close(window, true)
    end
    if vim.api.nvim_buf_is_valid(buffer) then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end, { buffer = buffer })

  vim.api.nvim_buf_set_option(buffer, "filetype", "terminal")
  vim.api.nvim_feedkeys("i", "n", true)
  vim.fn.termopen(command)
end

---------------------------------------------------------
-- Maven: find pom.xml
---------------------------------------------------------
local function find_pom_directory(start)
  local dir = start
  while dir and dir ~= "/" do
    if vim.fn.filereadable(dir .. "/pom.xml") == 1 then
      return dir
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return nil
end

---------------------------------------------------------
-- Maven auto-run
---------------------------------------------------------
local function maven_detected_run()
  local file = vim.fn.expand "%:p"
  local lines = vim.fn.readfile(file)

  if not lines or #lines == 0 then
    notify("No se pudo leer el archivo", vim.log.levels.ERROR)
    return
  end

  local package
  for _, line in ipairs(lines) do
    local pkg = line:match "^%s*package%s+([%w%.]+)%s*;"
    if pkg then
      package = pkg
      break
    end
  end

  if not package then
    notify("No se encontró package", vim.log.levels.ERROR)
    return
  end

  local classname = vim.fn.expand "%:t:r"
  local full_class = package .. "." .. classname
  local pom_dir = find_pom_directory(vim.fn.fnamemodify(file, ":h"))

  if not pom_dir then
    notify("No se encontró pom.xml", vim.log.levels.ERROR)
    return
  end

  local cd_cmd
  if vim.fn.has "win32" == 1 then
    cd_cmd = string.format('Set-Location "%s"', pom_dir)
  else
    cd_cmd = string.format("cd '%s'", pom_dir)
  end

  local mvn_cmd = string.format('mvn -q exec:java "-Dexec.mainClass=%s"', full_class)
  local full_cmd = cd_cmd .. " && " .. mvn_cmd

  open_floating_terminal(full_cmd)
end

---------------------------------------------------------
-- Build / Run selectors (ALL LANGUAGES)
---------------------------------------------------------
local function build_run()
  local ext = vim.fn.expand "%:e"

  local actions = {

    ---------------------------------------------------------
    -- JAVA + MAVEN + SPRING BOOT
    ---------------------------------------------------------
    java = {
      [ICONS.RUN .. ICONS.JAVA .. " Maven auto-run"] = function()
        maven_detected_run()
      end,
      [ICONS.BUILD .. ICONS.JAVA .. " Maven build"] = "mvn -q clean package",
      [ICONS.RUN .. ICONS.JAVA .. " Spring Boot run"] = "mvn spring-boot:run",
      [ICONS.BUILD .. ICONS.JAVA .. " Spring Boot build"] = "mvn -q clean install",
      [ICONS.RUN .. ICONS.JAVA .. " Java run"] = "java $fileBase",
      [ICONS.RUN .. ICONS.JAVA .. " Java compile & run"] = "javac % && java $fileBase",
    },

    ---------------------------------------------------------
    -- C#
    ---------------------------------------------------------
    cs = {
      [ICONS.BUILD .. " Build"] = "dotnet build",
      [ICONS.RUN .. " Run"] = "dotnet run",
    },

    ---------------------------------------------------------
    -- C / C++
    ---------------------------------------------------------
    -- IN LINUX DESCOMENT
    -- c = {
    --   [ICONS.RUN .. " Run"] = "$fileBase",
    --   [ICONS.BUILD .. " Compile"] = "gcc % -o $fileBase",
    --   [ICONS.RUN .. ICONS.BUILD .. " Compile & Run"] = "gcc % -o $fileBase && $fileBase",
    -- },

    -- cpp = {
    --   [ICONS.RUN .. " Run"] = "$fileBase",
    --   [ICONS.BUILD .. " Compile"] = "g++ % -o $fileBase",
    --   [ICONS.RUN .. ICONS.BUILD .. " Compile & Run"] = "g++ % -o $fileBase && $fileBase",
    -- },
    -- FOR WINDOWS
    c = {
      [ICONS.RUN .. " Run"] = ".\\$fileBase.exe",
      [ICONS.BUILD .. " Compile"] = "gcc % -o $fileBase",
      [ICONS.RUN .. ICONS.BUILD .. " Compile & Run"] = "gcc % -o $fileBase && .\\$fileBase.exe",
    },
    cpp = {
      [ICONS.RUN .. " Run"] = ".\\$fileBase.exe",
      [ICONS.BUILD .. " Compile"] = "g++ % -o $fileBase",
      [ICONS.RUN .. ICONS.BUILD .. " Compile & Run"] = "g++ % -o $fileBase && .\\$fileBase.exe",
    },

    ---------------------------------------------------------
    -- Python
    ---------------------------------------------------------
    py = {
      [ICONS.RUN .. " Run"] = "python %",
    },

    ---------------------------------------------------------
    -- JavaScript
    ---------------------------------------------------------
    js = {
      [ICONS.RUN .. " Run"] = "node %",
    },

    ---------------------------------------------------------
    -- TypeScript
    ---------------------------------------------------------
    ts = {
      [ICONS.BUILD .. " Compile"] = "tsc %",
      [ICONS.RUN .. " Run"] = "ts-node %",
      [ICONS.RUN .. ICONS.BUILD .. " Compile & Run"] = "tsc % && node $fileBase.js",
    },

    ---------------------------------------------------------
    -- PHP
    ---------------------------------------------------------
    php = {
      [ICONS.RUN .. " Run"] = "php %",
    },

    ---------------------------------------------------------
    -- Go
    ---------------------------------------------------------
    go = {
      [ICONS.RUN .. " Run"] = "go run %",
      [ICONS.BUILD .. " Build"] = "go build %",
    },

    ---------------------------------------------------------
    -- Rust
    ---------------------------------------------------------
    rust = {
      [ICONS.BUILD .. " Build"] = "cargo build",
      [ICONS.RUN .. " Run"] = "cargo run",
    },

    ---------------------------------------------------------
    -- Kotlin
    ---------------------------------------------------------
    kt = {
      [ICONS.BUILD .. " Compile"] = "kotlinc % -include-runtime -d $fileBase.jar",
      [ICONS.RUN .. " Run"] = "java -jar $fileBase.jar",
      [ICONS.RUN .. ICONS.BUILD .. " Compile & Run"] = "kotlinc % -include-runtime -d $fileBase.jar && java -jar $fileBase.jar",
    },

    ---------------------------------------------------------
    -- Ruby
    ---------------------------------------------------------
    rb = {
      [ICONS.RUN .. " Run"] = "ruby %",
    },

    ---------------------------------------------------------
    -- Shell
    ---------------------------------------------------------
    sh = {
      [ICONS.RUN .. " Run"] = "bash %",
    },

    ---------------------------------------------------------
    -- Swift
    ---------------------------------------------------------
    swift = {
      [ICONS.BUILD .. " Compile"] = "swiftc % -o $fileBase",
      [ICONS.RUN .. " Run"] = "./$fileBase",
      [ICONS.RUN .. ICONS.BUILD .. " Compile & Run"] = "swiftc % -o $fileBase && ./$fileBase",
    },

    ---------------------------------------------------------
    -- Zig
    ---------------------------------------------------------
    zig = {
      [ICONS.BUILD .. " Build"] = "zig build-exe %",
      [ICONS.RUN .. " Run"] = "./$fileBase",
      [ICONS.RUN .. ICONS.BUILD .. " Build & Run"] = "zig build-exe % && ./$fileBase",
    },
  }

  local entry = actions[ext]
  if not entry then
    notify("Tipo de archivo no soportado", vim.log.levels.WARN)
    return
  end

  vim.ui.select(vim.tbl_keys(entry), { prompt = "Acciones disponibles:" }, function(choice)
    if not choice then
      return
    end

    local action = entry[choice]
    if type(action) == "function" then
      local ok, err = pcall(action)
      if not ok then
        notify(err, vim.log.levels.ERROR)
      end
    else
      open_floating_terminal(substitute(action))
    end
  end)
end

---------------------------------------------------------
-- LazyGit / Ranger
---------------------------------------------------------
local function lazygit_toggle()
  if vim.fn.executable "lazygit" == 0 then
    notify("LazyGit no está instalado", vim.log.levels.ERROR)
    return
  end
  open_centered_terminal "lazygit"
end

local function ranger_toggle()
  if vim.fn.executable "ranger" == 0 then
    notify "Ranger no está instalado"
    return
  end
  open_floating_terminal "ranger"
end

---------------------------------------------------------
-- Export
---------------------------------------------------------
local M = {}
M.build_run = build_run
M.lazygit_toggle = lazygit_toggle
M.ranger_toggle = ranger_toggle

return M
