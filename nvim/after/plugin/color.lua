-- Change this to change the current theme
function set_theme()
    kanagawa()
end

-- Rose pine theme, moon variant
function rose_pine()
    require('rose-pine').setup({
        variant = 'moon'
    })

    vim.cmd('colorscheme rose-pine')
end

-- Kanagawa theme
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

function kanagawa_light()
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
    vim.cmd('colorscheme kanagawa-lotus')
end


set_theme()

