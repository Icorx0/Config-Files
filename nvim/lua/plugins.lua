local Plug = vim.fn['plug#']

-- Plugins go here
vim.call('plug#begin')
-- Status Bar
Plug('nvim-lualine/lualine.nvim')

-- Theme
Plug('catppuccin/nvim',{
    ['as']='catppuccin'
})

-- LSP and completition
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')

-- Snippets
Plug('L3MON4D3/LuaSnip', {
    ['tag']='v2.*',
    ['do']='make install_jsregexp'
})
Plug('saadparwaiz1/cmp_luasnip')

-- NvimTree
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')

-- Syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', {
    ['do']=':TSUpdate'
})

vim.call('plug#end')

