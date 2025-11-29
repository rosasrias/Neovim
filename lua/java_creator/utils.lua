local M = {}

-- Normalizes paths (Windows -> /)
function M.normalize(path)
  if not path then
    return ""
  end
  return path:gsub("\\", "/")
end

-- Scroll up until you find src/main/java
function M.find_java_root(start_dir)
  local dir = M.normalize(start_dir)
  if dir == "" then
    dir = vim.fn.getcwd()
  end

  while dir ~= "" and dir ~= "/" do
    -- Para Maven
    local maven_candidate = dir .. "/src/main/java"
    if vim.fn.isdirectory(maven_candidate) == 1 then
      return maven_candidate
    end

    -- Para Gradle
    local gradle_candidate = dir .. "/app/src/main/java"
    if vim.fn.isdirectory(gradle_candidate) == 1 then
      return gradle_candidate
    end

    -- Estructura alternativa
    local alt_candidate = dir .. "/src/java"
    if vim.fn.isdirectory(alt_candidate) == 1 then
      return alt_candidate
    end

    dir = M.normalize(vim.fn.fnamemodify(dir, ":h"))
  end

  return nil
end

-- Detects package relative to java_root (returns "" if none)
function M.detect_package_from_path(path, java_root)
  path = M.normalize(path)
  java_root = M.normalize(java_root)

  local relative = path:gsub("^" .. vim.pesc(java_root) .. "/", "")
  if relative == path then
    return ""
  end

  return relative:gsub("/", ".")
end

-- Creates recursive directory if it does not exist
function M.ensure_dir(path)
  path = M.normalize(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
  end
end

-- try formatting the buffer (if there is an LSP)
function M.try_format()
  local ok, _ = pcall(function()
    if vim.lsp and vim.lsp.buf then
      vim.lsp.buf.format { async = false }
    end
  end)
  return ok
end

function M.detect_framework()
  local cwd = vim.fn.getcwd()

  -- Detectar Spring Boot
  if vim.fn.filereadable(cwd .. "/pom.xml") == 1 or vim.fn.filereadable(cwd .. "/build.gradle") == 1 then
    return "spring"
  end

  -- Detectar Quarkus
  if vim.fn.filereadable(cwd .. "/src/main/resources/application.properties") == 1 then
    return "spring" -- o quarkus
  end

  return "plain"
end

return M
