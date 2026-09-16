local map = vim.keymap.set
local toggles = require("config.toggles")

-- Groupe "Toggle" : tout ce qui coupe/rallume une aide au code vit sous <leader>t
map("n", "<leader>tl", toggles.toggle_lsp, { desc = "Toggle LSP (complet)" })
map("n", "<leader>td", toggles.toggle_diagnostics, { desc = "Toggle diagnostics (erreurs/warnings)" })
map("n", "<leader>ta", toggles.toggle_copilot, { desc = "Toggle IA (Copilot)" })
map("n", "<leader>tf", toggles.toggle_autoformat, { desc = "Toggle autoformat à la sauvegarde" })
map("n", "<leader>ti", toggles.toggle_inlay_hints, { desc = "Toggle inlay hints" })
