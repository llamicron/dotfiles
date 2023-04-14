vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<leader>ga", function() 
    vim.cmd("Git add .")
    print("Git add .")
end)


vim.keymap.set("n", "<leader>gc", function() 
    vim.cmd("silent Git commit")
end)

