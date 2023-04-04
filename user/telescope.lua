local telescope = require "telescope"
local actions = require("telescope.actions")


require("neoclip").setup({
    keys = {
        telescope = {
            i = {
                paste_behind = '<A-a>'
            }
        }
    }
})

telescope.load_extension('neoclip')

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = {"smart"},

        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
})

