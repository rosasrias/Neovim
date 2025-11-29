local utils = require "java_creator.utils"
local templates = require "java_creator.templates"

local M = {}

local config = {
  spring_annotations = {
    Controller = "@RestController",
    Service = "@Service",
    Repository = "@Repository",
    Component = "@Component",
  },
  use_lombok = false,
}

local icons = {
  Class = " ",
  Interface = "󰠱 ",
  Enum = "󰘳 ",
  Record = "󰜫 ",
  Abstract = "󰙱 ",
  Exception = " ",
  Package = "󰉓 ",
  Entity = "󰎁 ",
  SpringController = "󰮠 ",
  SpringService = "󰚥 ",
  SpringRepository = "󰨸 ",
  SpringComponent = "󰡌 ",
}

-- split csv helper
local function split_csv(s)
  if not s or s == "" then
    return {}
  end
  local out = {}
  for v in s:gmatch "[^,]+" do
    local t = vim.trim(v)
    if t ~= "" then
      table.insert(out, t)
    end
  end
  return out
end

-- check exists and maybe overwrite
local function ensure_can_write(path, callback)
  if vim.fn.filereadable(path) == 1 then
    vim.ui.select({ "Overwrite", "Cancel", "Open" }, { prompt = "File exists: overwrite?" }, function(choice)
      if not choice then
        callback(false)
        return
      end

      if choice == "Open" then
        vim.cmd("edit " .. path)
        callback(false)
        return
      end

      if choice == "Cancel" then
        callback(false)
        return
      end

      -- Overwrite
      callback(true)
    end)
  else
    callback(true)
  end
end

-- Función principal mejorada con callbacks anidados
function M.create(kind)
  kind = kind or "Class"

  -- Primer input: nombre
  vim.ui.input({
    prompt = (icons[kind] or "") .. " Nombre de la " .. kind .. ": ",
  }, function(name)
    if not name or name == "" then
      vim.notify("Cancelado.", vim.log.levels.WARN)
      return
    end

    local function proceed_with_opts(opts)
      -- Path detection
      local current_file = utils.normalize(vim.api.nvim_buf_get_name(0))
      if current_file == "" then
        vim.notify("Abre un archivo dentro de src/main/java para detectar el package", vim.log.levels.ERROR)
        return
      end

      local current_dir = utils.normalize(vim.fn.fnamemodify(current_file, ":h"))
      local java_root = utils.find_java_root(current_dir)
      if not java_root then
        vim.notify("No encontré src/main/java en este proyecto", vim.log.levels.ERROR)
        return
      end

      local pkg = utils.detect_package_from_path(current_dir, java_root)

      local final_dir = java_root
      if pkg ~= "" then
        final_dir = java_root .. "/" .. pkg:gsub("%.", "/")
      end

      utils.ensure_dir(final_dir)

      local file_path = utils.normalize(final_dir .. "/" .. name .. ".java")

      -- Verificar si podemos escribir
      ensure_can_write(file_path, function(can_write)
        if not can_write then
          vim.notify("No se creó: " .. file_path, vim.log.levels.INFO)
          return
        end

        -- Crear contenido y archivo
        local content = templates.build(kind, pkg, name, opts)
        if not content then
          vim.notify("Tipo no soportado: " .. tostring(kind), vim.log.levels.ERROR)
          return
        end

        local f, err = io.open(file_path, "w")
        if not f then
          vim.notify("Error creando archivo: " .. (err or "unknown"), vim.log.levels.ERROR)
          return
        end
        f:write(content)
        f:close()

        utils.try_format()

        vim.notify((icons[kind] or "") .. " Creado: " .. file_path, vim.log.levels.INFO)
        vim.cmd("edit " .. file_path)
      end)
    end

    -- Inputs adicionales según el tipo
    if kind == "Enum" then
      vim.ui.input({
        prompt = "Valores del enum (comma-separated): ",
      }, function(values)
        local opts = { values = split_csv(values) }
        proceed_with_opts(opts)
      end)
    elseif kind == "Record" then
      vim.ui.input({
        prompt = "Parámetros del record (name:type, comma-separated): ",
      }, function(params)
        local opts = { params = split_csv(params) }
        proceed_with_opts(opts)
      end)
    elseif kind == "Entity" then
      -- Preguntar si quiere usar Lombok
      vim.ui.input({
        prompt = "¿Usar Lombok? (y/N): ",
        default = "N",
      }, function(use_lombok)
        local opts = { use_lombok = use_lombok:lower():find "^y" ~= nil }
        proceed_with_opts(opts)
      end)
    else
      proceed_with_opts {}
    end
  end)
end

-- Create complete package
function M.create_package()
  vim.ui.input({
    prompt = "Package a crear (ej: com.ejemplo.app): ",
  }, function(pkg)
    if not pkg or pkg == "" then
      vim.notify("Cancelado.", vim.log.levels.WARN)
      return
    end

    -- find java_root from the repo's cwd
    local cwd = utils.normalize(vim.fn.getcwd())
    local java_root = utils.find_java_root(cwd)
    if not java_root then
      vim.notify("No encontré src/main/java en el repo actual", vim.log.levels.ERROR)
      return
    end

    local target_dir = java_root .. "/" .. pkg:gsub("%.", "/")
    utils.ensure_dir(target_dir)

    -- optional package-info.java
    vim.ui.input({
      prompt = "Crear package-info.java? (y/N): ",
      default = "N",
    }, function(create_info)
      if create_info:lower():find "^y" then
        local path = utils.normalize(target_dir .. "/package-info.java")
        if vim.fn.filereadable(path) == 0 then
          local f = io.open(path, "w")
          if f then
            f:write("package " .. pkg .. ";\n\n/** Package " .. pkg .. " */\n")
            f:close()
          end
        end
      end

      vim.notify("󰉓 Paquete creado: " .. target_dir, vim.log.levels.INFO)
    end)
  end)
end

-- Función para configurar opciones desde fuera
function M.setup(user_config)
  config = vim.tbl_deep_extend("force", config, user_config or {})
end

return M
