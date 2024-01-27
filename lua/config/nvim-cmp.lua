local cmp = require("cmp");
local lspkind = require("lspkind")

cmp.setup {
    snippet = {
        expand = function (args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert {
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Esc>"] = cmp.mapping.close(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "async_path"},
        {name = "buffer", keyword_length = 2},
        {name = "emoji", insert = true},
        {name = "nvim_lsp_signature_help"},
        {name = "luasnip"},
        {name = "calc"},
        {name = "nvim_lua"},
    },
    completion = {
        keyword_length = 1,
        completeopt = "menu,noselect",
    },
    formatting = {
        format = lspkind.cmp_format {
            mode = "symbol_text",
        }
    }
}

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        {
            name = "cmdline",
        }
    })
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
'confirm_done',
cmp_autopairs.on_confirm_done()
)

-- https://old.reddit.com/r/neovim/comments/180fmw5/add_this_to_make_nvmcmp_docs_look_way_better_in/ka8of5r/
-- Render docs as sexy markdown
vim.api.nvim_create_autocmd('FileType', { pattern = 'cmp_docs', callback = function() vim.treesitter.start(0, 'markdown') end, })
