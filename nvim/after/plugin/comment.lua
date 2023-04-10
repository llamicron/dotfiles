local comment = require("Comment")

comment.setup({
    -- enable toggle comment in normal mode for the current line
    toggler = {
        line = '<C-_>',
    },
    -- enable toggle comment in visual mode for the selected block
    opleader = {
        line = '<C-_>'
    }
})
