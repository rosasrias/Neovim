return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy", -- se activa cuando entra la interfaz
  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
    smear_insert_mode = true, -- ojo, estaba mal escrito (tenías "smeart_insert_mode")
  },
}
