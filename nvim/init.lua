-- Lua configuration files
require('options')
require('plugins')

require('config.lualine')
require('config.cmp')
require('config.luasnip')
require('config.mason')
require('config.lsp')
require('config.nvimtree')
require('config.nvim-treesitter')


-- Auto wrap
vim.cmd('set textwidth=80')
vim.cmd('set wrap')

-- Theme
vim.cmd.colorscheme 'catppuccin-latte'

-- Custom commands
function Compile_latex()
    local filename = vim.fn.expand('%:t:r')
    local current_dir = vim.fn.getcwd()
    local latex_dir = '.latex/' .. vim.fn.expand('%:.:r')

    -- Ignores template.tex pdf
    if(filename == 'template') then
        return
    end

    -- Create directories for latex garbage and for pdf output and creates
    -- symbolic link if it doesn't exists
    vim.cmd('!mkdir -p ' .. latex_dir)
    vim.cmd('!ln -sfn ' .. vim.fn.expand('%.p') .. ' '
        .. latex_dir .. '/' .. filename .. '.tex')
    vim.cmd('!ln -sfn ' .. current_dir .. '/template.tex '
        .. latex_dir .. '/template.tex')

    -- Moves to the folder and creates the pdf
    vim.cmd('!cd ' .. latex_dir .. ' && lualatex -shell-escape ' .. filename
        ..'.tex')
end
vim.cmd([[
    autocmd BufWritePost *.tex lua Compile_latex()
]])

function Open_latex()
    local filename = vim.fn.expand('%:t:r')
    local latex_dir = '.latex/' .. vim.fn.expand('%:.:r')
    vim.cmd('!xdg-open ' .. latex_dir .. '/' .. filename .. '.pdf')
end
vim.cmd([[
  command! OpenLatex lua Open_latex() 
]])
