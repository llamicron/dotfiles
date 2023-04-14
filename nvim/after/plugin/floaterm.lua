vim.keymap.set("n", "<leader>ft", ":FloatermNew --name=float_term --height=0.9 --width=0.9 --autoclose=2 fish <CR>")
vim.keymap.set("n", "t", ":FloatermToggle myfloat<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")
