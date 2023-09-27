-- Some remaps for specific plugins will be in that plugins' after/plugin/plugin_name.lua file
-- This is for global general keymaps

local wk = require("which-key")
local telescope_bi = require('telescope.builtin')
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

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

-- Temporary, move this somewhere else
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

-- Project
wk.register({
    name = "Project",
    f = { telescope_bi.find_files, "Find file" },
    g = { telescope_bi.git_files, "Find Git file" },
    p = { "<cmd>TroubleToggle<cr>", "Toggle Problems" },
    s = {
        function () 
            telescope_bi.grep_string({ search = vim.fn.input("Grep > ") })
        end,
        "Search"
    },
    o = {
        "<cmd>AerialToggle<cr>",
        "Toggle outline"
    },
    v = { "<cmd>Ex<cr>", "View files" },
    t = {
        "<cmd>FloatermNew --height=1.0 --width=0.5 --position=right --autoclose=2 zsh <cr>",
        "Start terminal"
    },
    -- shoutout daddy prime
    a = {
        function()
            harpoon_ui.toggle_quick_menu()
        end,
        "Harpoon!"
    },
    A = {
        function()
            harpoon_mark.add_file()
            print("Ahoy!!! Harpooned!!!")
        end,
        "Harpoon file"
    },
    q = {
        function() harpoon_ui.nav_file(1) end,
        "Harpoon 1"
    },
    w = {
        function() harpoon_ui.nav_file(2) end,
        "Harpoon 2"
    },
    e = {
        function() harpoon_ui.nav_file(3) end,
        "Harpoon 3"
    },
    r = {
        function() harpoon_ui.nav_file(4) end,
        "Harpoon 4"
    },
}, { prefix = "<leader>p" })
-- Slightly weird, i like to just hit t to toggle the terminal
vim.keymap.set("n", "t", ":FloatermToggle <CR>")
-- Allows hitting escape in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")

-- Cargo
wk.register({
    name = "Cargo",
    b = { "<cmd>FloatermSend cargo build<cr><cmd>FloatermToggle<cr>", "Cargo build" },
    t = { "<cmd>FloatermSend cargo test -- --test-threads 1<cr><cmd>FloatermToggle<cr>", "Cargo test" },
    r = { "<cmd>FloatermSend cargo run<cr><cmd>FloatermToggle<cr>", "Cargo run" },
    c = { "<cmd>FloatermSend cargo check<cr><cmd>FloatermToggle<cr>", "Cargo Check"},
}, { prefix = "<leader>c" })

-- Git
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
    p = { "<cmd>Git push<cr>", "push" },
    f = { "<cmd>Git pull<cr>", "pull" },
    s = { "<cmd>Git status<cr>", "status" }
}, { prefix = "<leader>g" })

-- Layout
wk.register({
    name = "Layout",
    u = {
        "<cmd>UndotreeToggle<cr>",
        "Toggle UndoTree"
    },
    v = {
        "<cmd>vsplit<cr>",
        "Split Vertical"
    },
    s = {
        "<cmd>split<cr>",
        "Split Horizontal"
    },
    w = {
        "<cmd>set wrap!<cr>",
        "Toggle Line Wrapping"
    }
}, { prefix = "<leader>l" })

