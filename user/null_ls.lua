local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting

local sources = {
    formatting.eslint,
    formatting.prettier,
    formatting.autopep8,
    formatting.rustfmt,
    formatting.clang_format,
}

null_ls.setup({
    sources = sources,
})

vim.lsp.buf.format({ timeout_ms = 2000 })
