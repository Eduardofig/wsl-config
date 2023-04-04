require "user.luasnip_config"
require "user.lsp_config"
require "user.cmp_config"
require "user.appearance"
require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.rename"
require "user.term"
require "user.lualine"
require "user.nvim_tree"
require "user.treesitter"
require "user.comment"
require "user.autopairs"
require "user.telescope"
require "user.folds"

local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
