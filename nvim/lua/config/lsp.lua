-- Local variables
local lspcfg = require('lspconfig')
local opts = { noremap = true, silent = true, nowait = true }

-- Custom bindings for all lsp languages
local on_attach = function(_, bufnr)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    opts.buffer = bufnr
    vim.keymap.set('n', '<space>d', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<space>t', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>k', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.references, opts)
end

-- Configure each language
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Pyright
lspcfg['pyright'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        usePlaceholders = true,
    },
})
-- Lua
lspcfg['lua_ls'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'nvim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                },
            },
        },
    },
    init_options = {
        usePlaceholders = true,
    },
})

-- C, C++
lspcfg['clangd'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        usePlaceholders = true,
    },
})
