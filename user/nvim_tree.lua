-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true,
        }
    },
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

require("nvim-web-devicons").setup()

--[[ local function change_to_directory(data) ]]
--[[     local directory = vim.fn.getcwd() ]]
--[[]]
--[[     vim.cmd.cd(directory) ]]
--[[ end ]]

local function open_nvim_tree(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    vim.cmd.cd(data.file)

    require("nvim-tree.api").tree.open()
end


vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
--[[ vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = change_to_directory }) ]]
