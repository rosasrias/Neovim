local logic = require "java_creator.logic"

local M = {}

function M.setup()
  return {
    java_creator = function()
      local pickers = require "telescope.pickers"
      local finders = require "telescope.finders"
      local conf = require("telescope.config").values
      local actions = require "telescope.actions"
      local action_state = require "telescope.actions.state"

      local items = {
        { name = "Class", icon = "", desc = "Crear clase" },
        { name = "Interface", icon = "󰠱", desc = "Crear interface" },
        { name = "Enum", icon = "󰘳", desc = "Crear enum" },
        { name = "Record", icon = "󰜫", desc = "Crear record" },
        { name = "Abstract", icon = "󰙱", desc = "Crear abstract class" },
        { name = "Exception", icon = "", desc = "Crear exception" },
        { name = "Entity", icon = "󰎁", desc = "Crear entidad JPA" },
        { name = "SpringController", icon = "󰮠", desc = "Crear Controller Spring" },
        { name = "SpringService", icon = "󰚥", desc = "Crear Service Spring" },
        { name = "SpringRepository", icon = "󰨸", desc = "Crear Repository Spring" },
        { name = "SpringComponent", icon = "󰡌", desc = "Crear Component Spring" },
        { name = "Create Package", icon = "󰉓", desc = "Crear paquete" },
      }

      local results = {}
      for _, it in ipairs(items) do
        table.insert(results, string.format("%s  %s - %s", it.icon, it.name, it.desc))
      end

      pickers
        .new({}, {
          prompt_title = " Java Creator PRO",
          layout_config = { height = 0.50, width = 0.50 },
          finder = finders.new_table { results = results },
          sorter = conf.generic_sorter {},
          attach_mappings = function(prompt_bufnr, map)
            local do_select = function()
              local entry = action_state.get_selected_entry().value
              actions.close(prompt_bufnr)

              if entry:match "Create Package" then
                logic.create_package()
                return
              end

              local kind = entry:match "%s+([^%s%-]+)%s+%-"
              logic.create(kind)
            end

            map("i", "<CR>", do_select)
            map("n", "<CR>", do_select)
            return true
          end,
        })
        :find()
    end,
  }
end

return M
