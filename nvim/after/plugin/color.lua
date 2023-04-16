function set_theme()
    kanagawa()
end

function rose_pine()
    require('rose-pine').setup({
        variant = 'moon'
    })

    vim.cmd('colorscheme rose-pine')
end

function kanagawa()
    require('kanagawa').setup({
        colors = {
            theme = {
                all = {
                    ui = {
                        bg_gutter = "none"
                    }
                }
            }
        }
    })
    vim.cmd('colorscheme kanagawa')
end


set_theme()

