local logic = require "java_creator.logic"

local M = {}

function M.setup()
  -- Configurar vim.ui.select para usar Telescope
  require("telescope").setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          layout_config = {
            height = 50,
            width = 50,
          },
        },
      },
    },
  }

  -- Cargar la extensión ui-select
  require("telescope").load_extension "ui-select"

  -- Configurar vim.ui.select para usar Telescope como handler por defecto
  local function handle_ui_select(items, opts, on_choice)
    local themes = require "telescope.themes"
    local dropdown = themes.get_dropdown {
      layout_config = {
        height = 30,
        width = 30,
      },
      prompt_title = opts.prompt or "Select",
    }

    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"

    pickers
      .new(dropdown, {
        prompt_title = opts.prompt or "Select",
        finder = finders.new_table {
          results = items,
          entry_maker = function(entry)
            return {
              value = entry,
              display = entry,
              ordinal = entry,
            }
          end,
        },
        sorter = conf.generic_sorter(dropdown),
        attach_mappings = function(prompt_bufnr, map)
          map("i", "<CR>", function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if selection then
              on_choice(selection.value)
            else
              on_choice(nil)
            end
          end)

          map("i", "<Esc>", function()
            actions.close(prompt_bufnr)
            on_choice(nil)
          end)

          map("n", "<CR>", function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if selection then
              on_choice(selection.value)
            else
              on_choice(nil)
            end
          end)

          map("n", "q", function()
            actions.close(prompt_bufnr)
            on_choice(nil)
          end)

          return true
        end,
      })
      :find()
  end

  -- Establecer como handler por defecto
  vim.ui.select = handle_ui_select

  return {
    java_creator = function()
      -- ... el resto de tu código existente para el picker principal ...
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
