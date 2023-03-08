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
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autopairs = {
        enable = true,
    }
})
