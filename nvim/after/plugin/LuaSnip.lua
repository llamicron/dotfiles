require("luasnip.loaders.from_snipmate").lazy_load()

vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>luasnip-expand-or-jump", {expr = false})


