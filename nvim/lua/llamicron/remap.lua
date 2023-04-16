-- Some remaps for specific plugins will be in that plugins' after/plugin/plugin_name.lua file
-- This is for global general keymaps

local wk = require("which-key")
local telescope_bi = require('telescope.builtin')

vim.g.mapleader = " "

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
-- ctrl-s to save
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")


-- Project
wk.register({
    name = "Project",
    f = { telescope_bi.find_files, "Find file" },
    g = { telescope_bi.git_files, "Find Git file" },
    s = { 
        function () 
            telescope_bi.grep_string({ search = vim.fn.input("Grep > ") })
        end,
        "Search"
    },
    e = { "<cmd>Ex<cr>", "Explorer" },
}, { prefix = "<leader>p" })

-- Cargo
wk.register({
    name = "Cargo",
    b = { "<cmd>FloatermSend cargo build<cr><cmd>FloatermToggle<cr>", "Cargo build" },
    t = { "<cmd>FloatermSend cargo test -- --test-threads 1<cr><cmd>FloatermToggle<cr>", "Cargo test" },
    r = { "<cmd>FloatermSend cargo run<cr><cmd>FloatermToggle<cr>", "Cargo run" },
}, { prefix = "<leader>c" })

wk.register({
    name = "Git",
    a = {
        function() 
            vim.cmd("Git add .")
            print("Git add .")
        end,
        "add ."
    },
    c = { "<cmd>Git commit<cr>", "commit" },
    p = { "<cm>Git push<cr>", "push" },
    f = { "<cm>Git pull<cr>", "pull" },
    s = { "<cmd>Git status<cr>", "status" }
}, { prefix = "<leader>g" })
