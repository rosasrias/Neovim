local M = {}

-- Base templates (without package line)
M.generators = {}

M.generators["Class"] = function(name)
  return string.format(
    [[
public class %s {

}
]],
    name
  )
end

M.generators["Interface"] = function(name)
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

M.generators["Abstract"] = function(name)
  return string.format(
    [[
public abstract class %s {

}
]],
    name
  )
end

M.generators["Exception"] = function(name)
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

-- SPRING BOOT TEMPLATES
M.generators["Entity"] = function(name, opts)
  local use_lombok = opts and opts.use_lombok or false
  local annotations = ""

  if use_lombok then
    annotations = '@Data\n@Entity\n@Table(name = "' .. name:lower() .. '")'
  else
    annotations = '@Entity\n@Table(name = "' .. name:lower() .. '")'
  end

  return string.format(
    [[
%s
public class %s {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    // agregar más campos aquí
}
]],
    annotations,
    name
  )
end

M.generators["SpringController"] = function(name, _opts)
  return string.format(
    [[
@RestController
@RequestMapping("/api/%s")
public class %sController {
    
    @GetMapping
    public List<%s> findAll() {
        return List.of();
    }
    
    @GetMapping("/{id}")
    public %s findById(@PathVariable Long id) {
        return null;
    }
    
    @PostMapping
    public %s create(@RequestBody %s %s) {
        return null;
    }
}
]],
    name:lower(),
    name,
    name,
    name,
    name,
    name,
    name:lower()
  )
end

M.generators["SpringService"] = function(name, _opts)
  return string.format(
    [[
@Service
@Transactional
public class %sService {
    
    private final %sRepository %sRepository;
    
    public %sService(%sRepository %sRepository) {
        this.%sRepository = %sRepository;
    }
}
]],
    name,
    name,
    name:lower(),
    name,
    name,
    name:lower(),
    name:lower(),
    name:lower()
  )
end

M.generators["SpringRepository"] = function(name, _opts)
  return string.format(
    [[
@Repository
public interface %sRepository extends JpaRepository<%s, Long> {
    
}
]],
    name,
    name
  )
end

M.generators["SpringComponent"] = function(name, _opts)
  return string.format(
    [[
@Component
public class %s {
    // component code
}
]],
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
