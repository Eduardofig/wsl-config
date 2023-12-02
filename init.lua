require "user.luasnip_config"
--[[ require "user.rust_tools" ]]
require "user.lsp_config"
require "user.cmp_config"
require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.rename"
require "user.term"
require "user.lualine"
require "user.nvim_tree"
require "user.comment"
require "user.autopairs"
require "user.telescope"
require "user.folds"
require "user.git"
require "user.trouble"
require "user.null_ls"
require "user.dap"
require "user.treesitter"
require "user.appearance"
require "user.rest"

local notify = vim.notify
vim.notify = function(msg, ...)
    --[[ if msg:match("warning: multiple different client offset_encodings") then ]]
    --[[     return ]]
    --[[ end ]]

    --[[ notify(msg, ...) ]]

    return
end

vim.b.copilot_enabled = 0
