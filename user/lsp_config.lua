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

