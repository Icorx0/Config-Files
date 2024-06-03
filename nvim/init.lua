-- Lua configuration files
require('options')
require('plugins')

require('config.lualine')
require('config.cmp')
require('config.luasnip')
require('config.mason')
require('config.lsp')
require('config.nvimtree')

-- Theme
vim.cmd.colorscheme 'catppuccin-mocha'

-- Custom commands
function Compile_latex()
    local filename = vim.fn.expand('%:t:r')
    local filenamepath = vim.fn.expand('%:p:.')

    -- Create directories for latex garbage and for pdf output
    vim.cmd('!mkdir -p .latex/' .. filename)
    -- Creates the pdf
    vim.cmd('!pdflatex --output-directory=.latex/' .. filename .. ' ' .. filenamepath)
end
vim.cmd([[
    autocmd BufWritePost *.tex lua Compile_latex()
]])

function Open_latex()
    local filename = vim.fn.expand('%:t:r')
    vim.cmd('!xdg-open .latex/' .. filename .. '/' .. filename .. '.pdf')
end
vim.cmd([[
  command! OpenLatex lua Open_latex() 
]])
