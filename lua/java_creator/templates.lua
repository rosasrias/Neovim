local M = {}

-- Base templates (without package line)
M.generators = {}

M.generators["Class"] = function(name, _opts)
  return string.format(
    [[
public class %s {

}
]],
    name
  )
end

M.generators["Interface"] = function(name, _opts)
  return string.format(
    [[
public interface %s {

}
]],
    name
  )
end

M.generators["Enum"] = function(name, opts)
  local values = opts and opts.values or {}
  local body = ""
  if #values > 0 then
    body = table.concat(values, ", ") .. ";"
  end
  return string.format(
    [[
public enum %s {
  %s

}
]],
    name,
    body
  )
end

M.generators["Record"] = function(name, opts)
  local params = opts and opts.params or {}
  local params_str = table.concat(params, ", ")
  return string.format(
    [[
public record %s(%s) {

}
]],
    name,
    params_str
  )
end

M.generators["Abstract"] = function(name, _opts)
  return string.format(
    [[
public abstract class %s {

}
]],
    name
  )
end

M.generators["Exception"] = function(name, _opts)
  return string.format(
    [[
public class %s extends Exception {

  public %s() {
    super();
  }

}
]],
    name,
    name
  )
end

-- helper to produce final content with package line
function M.build(kind, pkg, name, opts)
  local generator = M.generators[kind]
  if not generator then
    return nil
  end

  local pkg_line = ""
  if pkg and pkg ~= "" then
    pkg_line = "package " .. pkg .. ";\n\n"
  end

  local body = generator(name, opts or {})
  return pkg_line .. body
end

return M
