toggleterm = require "toggleterm"

toggleterm.setup({ 
    open_mapping = [[<c-t>]],
    direction = "float",
    shade_terminals = false,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "normal",
            background = "normal",
        },
    },
})

