-- Local variables
local api = require "nvim-tree.api"
local opts = { noremap = true, silent = true, nowait = true }

-- Custom bindings
vim.keymap.set('n', '<C-e>', '<cmd> NvimTreeToggle<CR>', opts)

-- Custom binding on the nvim-tree mode
local function on_attach(bufnr)
    opts.buffer = bufnr

    -- Navigation options
    vim.keymap.set('n', 'h',        api.node.navigate.parent_close, opts)
    vim.keymap.set('n', 'l',        api.node.open.edit,             opts)
    vim.keymap.set('n', '<C-e>',    api.tree.close,                 opts)
    vim.keymap.set('n', '<C-l>',    api.tree.change_root_to_node,   opts)
    vim.keymap.set('n', '<C-h>',    api.tree.change_root_to_parent, opts)

    -- Edit options
    vim.keymap.set('n', 'r',        api.fs.rename,                  opts)
    vim.keymap.set('n', 'a',        api.fs.create,                  opts)
    vim.keymap.set('n', 'd',        api.fs.remove,                  opts)
    vim.keymap.set('n', 'p',        api.fs.paste,                   opts)
    vim.keymap.set('n', 'c',        api.fs.copy.node,               opts)
end

-- Setup
require('nvim-tree').setup({
    -- Disable netrw to use nvim-tree
    disable_netrw = true,
    hijack_netrw = true,
    -- Config
    view = {
        width = 80,
        number = true,
        relativenumber = true,
    },
    sort = {
        sorter = 'case_sensitive',
    },
    filters = {
        dotfiles = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    -- Diagnostics
    diagnostics = {
        enable = true,
        icons = {
            hint = 'H',
            info = 'I',
            warning = "W",
            error = "E",
        }
    },
    -- Git configuration
    git = {
        enable = true,
        ignore = false,
    },
    renderer = {
        icons = {
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "",
                    untracked = "U",
                    deleted = "󰛲",
                    ignored = "◌",
                }
            },
        },
    },
    -- Bindgins
    on_attach = on_attach,
})
