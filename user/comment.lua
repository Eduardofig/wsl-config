local comment = require "Comment"

local commentstring = require "ts_context_commentstring.utils"
local commentinternal = require "ts_context_commentstring.internal"

comment.setup {
    pre_hook = function(ctx)
        local U = require "Comment.utils"

        local location = nil

        if ctx.ctype == U.ctype.block then
            location = commentstring.get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = commentstring.get_visual_start_location()
        end

        return commentinternal.calculate_commentstring {
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
        }

    end,

    toggler = {
        line = '<C-n>',
        block = '<C-p>',
    },

    opleader = {
        line = '<C-n>',
        block = '<C-p>',
    }
}
