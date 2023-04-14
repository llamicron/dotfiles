-- Some remaps for specific plugins will be in that plugins' after/plugin/plugin_name.lua file
-- This is for global general keymaps

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Allow for moving highlighted lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Makes cursor stay in the same place when moving up lines with J
vim.keymap.set("n", "J", "mzJ`z")

-- Allows for half-page jumping with cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<C-u>zz")


-- Keeps the cursor in the middle when searching but doesn't work?
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Allows copying into the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Very cool one! `ci"` will jump to first string on line and delete it's contents
-- it's like "cut out inside of " and then whatever character you give it
-- Example, 'ciw' is cut out word, deletes the current word
--          'ci(' will cut out the content of the next perentheses
-- similar, 'ca"' will remove everything, including the quotes
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")

-- Cargo stuff
vim.keymap.set("n", "<leader>cb", function()
    vim.cmd("FloatermSend cargo build")
    vim.cmd("FloatermToggle")
end)

vim.keymap.set("n", "<leader>ct", function()
    -- Many of my applications won't succeed on multiple threads
    -- because of shared resources like files or hardware
    vim.cmd("FloatermSend cargo test -- --test-threads 1")
    vim.cmd("FloatermToggle")
end)

vim.keymap.set("n", "<leader>cr", function()
    vim.cmd("FloatermSend cargo run")
    vim.cmd("FloatermToggle")
end)

