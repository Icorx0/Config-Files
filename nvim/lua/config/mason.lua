-- Setup mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Required lsp lenguages
require('mason-lspconfig').setup({
    ensure_installed = { 'pylsp', 'lua_ls', 'rust_analyzer', 'clangd', 'pyright', 'jdtls'},
    automatic_installation = true,
})
