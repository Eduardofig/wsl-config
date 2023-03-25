local telescope = require "telescope"
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = {"smart"},

        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
            },
        },
    },
})
