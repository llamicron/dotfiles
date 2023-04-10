local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'rust_analyzer',
	'eslint',
	'tsserver'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- Vim code actions
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
end)

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.setup()
