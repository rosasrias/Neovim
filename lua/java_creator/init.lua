local M = {}

function M.setup(user_config)
  local logic = require "java_creator.logic"
  logic.setup(user_config) -- Pasar configuración
  local telescope = require "telescope"
  telescope.register_extension(require("java_creator.telescope").setup())
end

return M
