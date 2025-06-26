local map = vim.keymap.set

map("n", "<C-a>", "gg<S-v>G", { desc = "[S]elect All [D]ocument" })
map("n", "<C-b>", "<cmd>lua require('core.functions').build_run()<cr>", { desc = "[E]xecute [C]ode" })
map("n", "<leader>tk", "<cmd>lua require('themes.pick').setup()<cr>", { desc = "[P]ick [T]heme" })
map("n", "<leader>gg", "<cmd>lua require('core.functions').lazygit_toggle()<cr>", { desc = "[L]azygit [T]oggle" })
map("n", "<leader>rr", "<cmd>lua require('core.functions').ranger_toggle()<cr>", { desc = "[R]anger [T]oggle" })
