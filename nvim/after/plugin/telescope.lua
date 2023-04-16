local builtin = require('telescope.builtin')

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
