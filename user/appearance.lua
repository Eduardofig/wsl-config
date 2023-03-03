-- appearance
vim.cmd[[colorscheme nightfox]]
vim.cmd[[hi Normal guibg=none]]
vim.cmd[[hi clear SignColumn]]
vim.cmd[[hi clear SignColumn]]
vim.cmd[[hi clear TabLineFill]]
vim.cmd[[hi clear VertSplit]]
vim.cmd[[hi clear Tabline]]
vim.cmd[[hi Pmenu guibg=#161929]]
vim.cmd[[hi DiagnosticVirtualTextInfo guibg=None]]
vim.cmd[[hi DiagnosticVirtualTextError guibg=None]]
vim.cmd[[hi DiagnosticVirtualTextWarn guibg=None]]
vim.cmd[[hi DiagnosticVirtualTextHint guibg=None]]
vim.cmd[[hi DiagnosticVirtualTextHint guibg=None]]
vim.cmd[[hi Type guifg=#D16464]]

-- treesitter_config
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true
    },
    ensure_installed = {
        'c',
        'lua',
        'rust',
        'cpp',
        'python',
        'javascript',
        'typescript',
    }
})
