-- cmp config
--
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local cmp = require 'cmp'
local signature = require 'lsp_signature'

signature.setup()


local kind_icons = {
    Class = "",
    Color = "",
    Constant = "ﲀ",
    Constructor = "",
    Enum = "練",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "ﰮ",
    Keyword = "",
    Method = "",
    Module = "",
    Operator = "",
    Property = "",
    Reference = "",
    Snippet = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "塞",
    Value = "",
    Variable = "",
}
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = { 
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = 'Normal:Pmenu,FloatBorder:None',
            selected_item = { highlight="PmenuSel", icon=">> "}
        },
        documentation = { 
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = 'Normal:Pmenu,FloatBorder:None'
        }, 
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-r>'] = cmp.mapping.scroll_docs(-4),
        ['<C-b>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = function()
            if luasnip.expandable() then
                luasnip.expand()
            end
        end,
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path'},
        { name = 'treesitter'},
    }
    ),
    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = function(entry, vim_item)

            if entry ~= nil then
                print(vim.inspect(entry.id))
            end

            if cmp.get_selected_entry() == entry then
                vim_item.menu = string.format("this item %s[%s]", vim_item.kind, entry.source.name:gsub("^%l", string.upper))
            end

            vim_item.menu = string.format("%s[%s]", vim_item.kind, entry.source.name:gsub("^%l", string.upper))
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            return vim_item
        end
    }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    })
})

local cmp_autopairs = require"nvim-autopairs.completion.cmp"

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = {tex = "" } } )
-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --    capabilities = capabilities
    -- }
