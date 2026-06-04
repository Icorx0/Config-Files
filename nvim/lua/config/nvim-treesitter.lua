-- Ensure parsers are installed
local parsers = { "c", "lua", "vim", "vimdoc", "query", "java", "python", "go" }
local installed = require('nvim-treesitter').get_installed()

local to_install = {}
for _, lang in ipairs(parsers) do
    if not vim.tbl_contains(installed, lang) then
        table.insert(to_install, lang)
    end
end

if #to_install > 0 then
    require('nvim-treesitter').install(to_install)
end
