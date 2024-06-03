-- Custom parameters
local c_filename = {
    'filename',
    file_status = true,
    path = 1,
    shorting_target = 50,
}
local c_diagnostics = {
    'diagnostics',
    sources = { 'nvim_lsp' },
    sections = { 'error', 'warn' },
    symbols = {error = 'E', warn = 'W' },
}
local c_filetype = {
    'filetype',
    colored = false,
}

-- Setup
require('lualine').setup {
    options = {
        icons_enabled = true,
        --theme = 'nord',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    -- In focused window
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {c_filename},
        lualine_x = {c_filetype},
        lualine_y = {c_diagnostics},
        lualine_z = {'location'}
    },
    -- In unfocused windows
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {c_filename},
        lualine_x = {},
        lualine_y = {c_diagnostics},
        lualine_z = {}
    },
}
