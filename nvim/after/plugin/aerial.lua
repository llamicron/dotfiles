local aerial = require("aerial")
aerial.setup()
vim.api.nvim_set_keymap("n", "<leader>o", "<Plug>luasnip-expand-or-jump", { desc = "Toggle Aerial sidebar" })
