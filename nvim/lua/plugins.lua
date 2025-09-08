-- This file configures the lazy.nvim plugin manager.

-- This section ensures lazy.nvim is installed automatically
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- List of plugins to install and manage, translated from your vim-plug config
require("lazy").setup({
  -- Theme
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' } -- Icons for status line
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' } -- Icons for file explorer
  },

  -- Syntax highlighting and parsing
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Command to run after installing/updating
    config = function()
      require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
    end
  },

  -- LSP (Language Server Protocol) support
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },

  -- Autocompletion engine
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',   -- Completions from LSP
      'hrsh7th/cmp-path',       -- Completions for file paths
      'hrsh7th/cmp-cmdline',    -- Completions for command line
      'hrsh7th/cmp-buffer',     -- Completions from current buffer (good default to have)
      'L3MON4D3/LuaSnip',       -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Bridge between cmp and luasnip
    }
  },

  -- Snippet engine
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = "v2.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
})

