-- Setup
require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "latex", "java",
        "python", "go" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype.
        -- (for example if you want to disable highlighting for the `tex`
        -- filetype, you need to include `latex` in this list as this is
        -- the name of the parser)

        -- list of language that will be disabled
        disable = { },
    },
})
