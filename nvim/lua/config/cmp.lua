-- Local variables
local cmp = require('cmp')
local ls = require('luasnip')

-- Setup
cmp.setup({
    -- Snippet engine
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
    -- Add borders to cmp windows
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- Key maps for cmp windows and completion
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-h>'] = cmp.mapping.abort(),
        ['<C-l>'] = cmp.mapping.confirm({ select = true }),
    }),
    -- Sources for cmp
    sources = cmp.config.sources({
        {
            name = 'nvim_lsp',
            -- Filter out Text suggestions in cmp
            entry_filter = function(entry, _)
                local kind = cmp.lsp.CompletionItemKind[entry:get_kind()]

                if kind == 'Text' then
                    return false
                end
                return true
            end
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    }),
})
