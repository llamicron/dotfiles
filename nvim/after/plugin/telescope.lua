local builtin = require('telescope.builtin')
-- Project find, just find files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Search through only git files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Grep through your codebase and pull up files that contain the search in Telescope
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Telescope options
require('telescope').setup {
    defaults = {
        -- patterns to ignore
        file_ignore_patterns = {
            "target",
            "node_modules"
        }
    }
}
