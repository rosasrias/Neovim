return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    -- Config mínima de ejemplo
    usercmds = true, -- habilita :Cord on/off
    idle = {
      enabled = true,
      timeout = 300000, -- 5 min
    },
    text = {
      editing = "Editando %s",
      file_browser = "Navegando %s",
      plugin_manager = "Gestionando plugins",
    },
  },
}
