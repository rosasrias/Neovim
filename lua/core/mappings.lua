local map = vim.keymap.set

map("n", "<C-a>", "gg<S-v>G", { desc = "[S]elect All [D]ocument" })
map("n", "<C-b>", "<cmd>lua require('core.functions').build_run()<cr>", { desc = "[E]xecute [C]ode" })
map("n", "<leader>tk", "<cmd>lua require('themes.pick').setup()<cr>", { desc = "[P]ick [T]heme" })
map("n", "<leader>gg", "<cmd>lua require('core.functions').lazygit_toggle()<cr>", { desc = "[L]azygit [T]oggle" })
map("n", "<leader>rr", "<cmd>lua require('core.functions').ranger_toggle()<cr>", { desc = "[R]anger [T]oggle" })
-- 🔽🔼 Mover líneas
map("n", "<A-j>", ":m .+1<CR>==", { desc = "[M]ove line [D]own" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "[M]ove line [U]p" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "[M]ove selection [D]own" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "[M]ove selection [U]p" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Statusline
map("n", "<leader>us", function()
  require("ui/stl/pickstl").select_status_style()
end, { desc = "Change Statusline Style" })

-- Terminal
map("n", "<leader>th", "<cmd>Terminal<cr>", { desc = "[T]erminal [H]orizontal" })
