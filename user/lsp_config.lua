-- lsp_config

local server_list = {
    clangd = {},
    --jedi_language_server = {},
    --pylsp = {},
    pyright = {
        python = {
            analysis = {
                useLibraryCodeForTypes = true
            }, 
            path = "/usr/bin/python3"
        }
    },
    tsserver = {},
    --[[ sumneko_lua = {}, ]]
    --rust_analyzer = {},
    bashls = {},
    jdtls = {},
    prosemd_lsp = {},
    html = {},
    tailwindcss = {},
}

local installer_opts = {
    automatic_installation = true,
    ensure_installed = server_list
}

local lsp_installer = require "nvim-lsp-installer"

lsp_installer.setup(installer_opts)

local lspcfg = require "lspconfig"

for server, opts in pairs(server_list) do
    lspcfg[server].setup(opts)
end

require('rust-tools').setup{}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Information = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

local tw_highlight = require('tailwind-highlight')

lspcfg.tailwindcss.setup({
  on_attach = function(client, bufnr)
    -- rest of you config
    tw_highlight.setup(client, bufnr, {
      single_column = false,
      mode = 'background',
      debounce = 200,
    })
  end
})
