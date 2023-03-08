local npairs = require "nvim-autopairs"

npairs.setup {
    check_ts = true,
    fast_wrap = {
        map = '<C-h>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment',
    },
}
