-- Local variables
local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local ms = ls.multi_snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local rep = require('luasnip.extras').rep

-- Custom Keybindings for snippets
vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-h>", function() ls.jump(-1) end, {silent = true}) vim.keymap.set({"i", "s"}, "<C-j>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-k>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end, {silent = true})

-- Snippets 

-- All snippets
ls.add_snippets('all',{
    -- Close brackets
    s('(',{
        t('('),i(1),t(')'),i(0)
    }),
    s('\\(',{
        t('\\('),i(1),t('\\)'),i(0)
    }),
    s('[',{
        t('['),i(1),t(']'),i(0)
    }),
    s('\\[',{
        t('\\['),i(1),t('\\]'),i(0)
    }),
    s('{',{
        t('{'),i(1),t('}'),i(0)
    }),
    s('\\{',{
        t('\\{'),i(1),t('\\}'),i(0)
    }),
    s('\'',{
        t('\''),i(1),t('\''),i(0)
    }),
    s('\"',{
        t('\"'),i(1),t('\"'),i(0)
    }),
    s('<',{
        t('<'),i(1),t('>'),i(0)
    }),
})

-- Latex snippets
local function tex_trig(string)
    return { string, '\\' .. string}
end

ls.add_snippets('tex',{
    -- Text
    ms(tex_trig('mcal'),{
        t('\\mathcal{'),i(1),t('}'),i(0)
    }),
    ms(tex_trig('mbb'),{
        t('\\mathbb{'),i(1),t('}'),i(0)
    }),
    ms(tex_trig('msrc'),{
        t('\\mathsrc{'),i(1),t('}'),i(0)
    }),
    ms(tex_trig('mfrak'),{
        t('\\mathfrak{'),i(1),t('}'),i(0)
    }),
    ms(tex_trig('bolds'),{
        t('\\boldsymbol{'),i(1),t('}'),i(0)
    }),
    ms(tex_trig('bold'),{
        t('\\textbf{'),i(1),t('}'),i(0)
    }),
    ms(tex_trig('underline'),{
        t('\\underline{'),i(1),t('}'),i(0)
    }),
    ms(tex_trig('overline'),{
        t('\\overline{'),i(1),t('}'),i(0)
    }),
    -- Math integration
    ms(tex_trig('begin'),{
        t('\\begin{'), i(1), t('}'),
        -- Enumerate label integration
        c(2, {t(''),
            sn(1, {
                t('[label='),
                i(1, '\\alph*)'),
                t(']')
            }),
        }),
        t({'', '\t'}), i(3),
        t({'', '\\end{'}), rep(1), t('}'),
        i(0)
    }),
    ms(tex_trig('im'),{
        t('\\('),i(1),t('\\)'),i(0)
    }),
    ms(tex_trig('dm'),{
        t('\\['),i(1),t('\\]'),i(0)
    }),
    ms(tex_trig('frac'),{
        t('\\frac{'),i(1),t('}{'),i(2),t('}'),i(0)
    }),
    ms(tex_trig('binom'),{
        t('\\binom{'),i(1),t('}{'),i(2),t('}'),i(0)
    }),
    ms(tex_trig('sum'),{
        t('\\sum_{'),i(1,'n=1'),t('}^{'),i(2,'\\infty'),t('}'),i(0)
    }),
    ms(tex_trig('lim'),{
        t('\\lim_{'),i(1,'n'),t('\\to '),i(2,'\\infty'),t('}'),i(0)
    }),
    ms(tex_trig('int'),{
        t('\\int_{'),i(1,'a'),t('}^{'),i(2,'b'),t('}'),i(0)
    }),
    ms(tex_trig('fun'),{
        i(1,'f'),t(':'),i(2,'\\mathbb{R}'),t('\\to '),i(3,'\\mathbb{R}'),i(0)
    }),
    ms(tex_trig('norm'),{
        t('\\|'),i(1),t('\\|'),
    }),
    ms(tex_trig('inner'),{
        t('\\langle '),i(1),t('\\rangle'),
    }),
    ms(tex_trig('abs'),{
        t('|'),i(1),t('|'),
    }),
    ms(tex_trig('left'),{
        t('\\left'),i(1),t(' '),i(3),t(' \\right'),rep(2),i(0)
    }),
    ms(tex_trig('underbrace'),{
        t('\\underbrace{'),i(1),t('}_{'),i(2),t('}'),i(0)
    }),
    ms(tex_trig('overbrace'),{
        t('\\overbrace{'),i(1),t('}^{'),i(2),t('}'),i(0)
    }),
    -- Custom operators
    ms(tex_trig('laplace'),{
        t('\\mathcal{L}\\{'),i(1),t('\\}'),i(0)
    }),
    ms(tex_trig('invlaplace'),{
        t('\\mathcal{L}^{-1}\\{'),i(1),t('\\}'),i(0)
    }),
    -- Math tikz figures
    s('tikz',{
        t('\\begin{center}'),
        t({'','\t\\begin{tikzpicture}['}),i(1),t(']'),
        t({'','\t\t'}),i(0),
        t({'','\t\\end{tikzpicture}'}),
        t({'','\\end{center}'})
    }),
    s('axis',{
        t('\\begin{axis}['),
        t('xmin='),i(1,'-10'),t(','),t('xmax='),i(2,'10'),t(','),
        t('ymin='),i(3,'-10'),t(','),t('ymax='),i(4,'10'),t(','),
        t({'','\taxis lines='}),i(5,'middle'),t(','),
        t({'','\tylabel='}),i(6,'\\(y\\)'),t(','),
        t({'','\txlabel='}),i(7,'\\(x\\)'),t(','),
        c(8,{
            t({'','\tyticklabel=\\empty'}),t(','),
            sn(1,{
                t({'','\tytick={'}),i(1),t('},'),
                t({'','\tyticklabels={'}),i(2),t('},'),
            }),
        }),
        c(9,{
            t({'','\txticklabel=\\empty'}),t(','),
            sn(1,{
                t({'','\txtick={'}),i(1),t('},'),
                t({'','\txticklabels={'}),i(2),t('},'),
            }),
        }),
        t({']',''}),
        i(0),
        t({'','\\end{axis}'})
    }),
    ms(tex_trig('addplot'),{
        t('\\addplot[domain='),i(1,'-10'),t(':'),i(2,'10'),
        t(' ,color='),i(3,'blue'),t(' ,samples='),i(4,'100'),t(']'),
        c(5,{
            sn(1,{
                t(' {'),i(1),t('};'),
                f(function (args,_,_)
                    return {'', '\\addlegendentry{\\(' .. args[1][1] .. '\\)}'}
                end,{1},{}),
            }),
            sn(2,{
                t('('),i(1,'0'),t(','),i(2,'0'),t(') -- ('),i(3,'0'),t(','),i(4,'0'),t(');')
            }),
        }),
        i(0),
    }),
    ms(tex_trig('suc'),{
        t('('),i(1,'x_n'),t(')_{'),i(2,'n'),t('\\in\\mathbb{N}}')
    }),
    -- Template snippet
    ms(tex_trig('template'),{
        t('\\input{template.tex}'),
        t({'','% Title'}),
        t({'','\\begin{document}'}),
        t({'','\\begin{center}'}),
        t({'','\t\\large{'}),i(1,'Class name'),t('}\\\\'),
        t({'','\t\\normalsize{Bruno Wong}'}),
        t({'','\\end{center}'}),
        t({'','\\tableofcontents'}),
        t({'','% Content'}),
        t(''),i(0),
        t({'','\\end{document}'}),
    })
})
ls.filetype_extend('plaintex',{'tex'})

ls.add_snippets('cpp',{
    -- Template snippet
    s('template',{
        t({
        "#include <bits/stdc++.h>",
        "#define ll long long",
        "#define EPS 1e-16",
        "#define INF 1e16",
        "#define ENDL \"\\n\"",
        "",
        "using namespace std;",
        "",
        "void solve() {","\t"}),
        i(0),
        t({"",
        "}",
        "",
        "int main(void) {",
            "\tcin.tie(0);",
            "\tcout.tie(0);",
            "\tios::sync_with_stdio(false);",
            "\tint t = 1;",
            "\tcin >> t;",
            "\twhile(t--) solve();",
            "\treturn 0;",
        "}",}),
    }),
})
