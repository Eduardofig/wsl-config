-- lsp_config

local server_list = {
    clangd = {},
    pyright = {
        python = {
            analysis = {
                useLibraryCodeForTypes = true
            }
        }
    },
    tsserver = {},
    --sumneko_lua = {},
    rust_analyzer = {},
    bashls = {},
    --jdtls = {},
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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

