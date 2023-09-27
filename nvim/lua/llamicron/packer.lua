-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Install themes, see after/plugin/color.lua
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use("rebelot/kanagawa.nvim")

    -- Telescope, for finding files
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Single line uses
    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
    -- Treesitter playground
    -- Not using this right now, but it's cool for later
    -- use('nvim-treesitter/playground')
    -- Harpoon, a file quickswitcher made by our boy
    use('theprimeagen/harpoon')
    -- Undotree
    use('mbbill/undotree')
    -- This is for git? Don't really know what this is for
    use('tpope/vim-fugitive')
    -- Aerial, file outline
    use("stevearc/aerial.nvim")
    -- Comment, allows for quick switching of comments
    use('numToStr/Comment.nvim')
    -- Autoclose quotes and brackets
    use('m4xshen/autoclose.nvim')
    -- Floaterm
    use('voldikss/vim-floaterm')
    -- Emmet
    use('mattn/emmet-vim')
    -- Icons
    use("nvim-tree/nvim-web-devicons")
    -- Trouble
    use("folke/trouble.nvim")

    -- LuaSnip for snippets
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v<CurrentMajor>.*",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    -- Which Key
    use {
        "folke/which-key.nvim",
        config = function()
        end
    }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, 
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

end)
