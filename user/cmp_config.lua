-- cmp config
--
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local cmp = require 'cmp'
local view = require 'cmp.view'
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
    Type = "",
    Unit = "塞",
    Value = "",
    Variable = "",
}


function add_caret()

    --[[ local idx = 1 ]]
    --[[ for i, entry in ipairs(cmp.get_entries()) do ]]
    --[[     if entry == cmp.get_selected_entry() then ]]
    --[[         idx = i ]]
    --[[     end ]]
    --[[ end ]]
    --[[]]
    --[[ if idx < #cmp.get_entries() then ]]
    --[[     cmp.get_entries()[idx + 1].completion_item.label = "Teste" ]]
    --[[ end ]]
    --[[]]
    --[[ cmp.select_next_item() ]]
end

function remove_caret()
    --[[ local selected_entry = cmp.get_selected_entry() ]]
    --[[ if selected_entry ~= nil then ]]
    --[[     selected_entry:get_vim_item().kind = '>' ]]
    --[[     print(selected_entry:get_vim_item()) ]]
    --[[ end ]]
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = { 
            border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
            --[[ border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, ]]
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel'
        },
        documentation = { 
            border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
            winhighlight = 'Normal:None,FloatBorder:Pmenu'
        }, 
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-r>'] = cmp.mapping.scroll_docs(-4),
        ['<C-b>'] = cmp.mapping.scroll_docs(4),
        ['<C-h>'] = cmp.mapping.confirm({ select = true }),
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert, count = 1 }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert, count = 1 }),
        ['<C-Space>'] = function()
            if luasnip.expandable() then
                luasnip.expand()
            end
        end,

        ['<C-u>'] = function()
            add_caret()
        end,
        ['<C-*>'] = function()
            remove_caret()
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
    }
    ),
    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = function(entry, vim_item)

            vim_item.menu = string.format("%s[%s]", vim_item.kind, entry.source.name:gsub("^%l", string.upper))
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


require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ': '
  },
  popup = {
    position = {
      row = '40%',
      col = '50%',
    },
    size = {
      width = '60%',
    },
    border = {
      style = 'rounded',
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },
  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      local fn = require('fine-cmdline').fn
      -- code

      vim.keymap.set('i', '<C-n>', fn.complete_or_next_item, {buffer = input.bufnr})
      vim.keymap.set('i', '<C-p>', fn.stop_complete_or_previous_item, {buffer = input.bufnr})
    end,
    set_keymaps = function(imap, feedkeys)
      -- code
    end
  }
})

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', ':', '<cmd>FineCmdline<CR>', {noremap = true})
