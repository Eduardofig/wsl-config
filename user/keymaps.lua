-- 
-- keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

function copilot_toggle_active()
    if vim.b.copilot_enabled == 1 then
        vim.b.copilot_enabled = 0
        print("Copilot disabled")
    else
        vim.b.copilot_enabled = 1
        print("Copilot enabled")
    end
end

local imaps = {
    {'<C-l>', '<Esc>viw~ea', {}},
    {'<C-o>', '<Esc>A;<Esc>', {}},
    {'<C-j>', '<C-n>', {}},
    {'<C-k>', '<C-p>', opts},
    {'<C-k>', '<C-p>', opts},
    {'<C-]>', '<Plug>(copilot-next)', opts},
    {'<C-i>', '<Esc>A', opts},
    {'<Esc>', '<Esc>:w<CR>', opts},
    --[[ {'<Esc>', '<Esc>:w<CR>', {}}, ]]
}

for i = 1, #imaps do
    keymap('i', imaps[i][1], imaps[i][2], imaps[1][3])
end

local nmaps = {
    {'u', 'u:w<CR>', opts},
    {'<C-r>', '<C-r>:w<CR>', opts},
    {'p', 'p:w<CR>', opts},
    {'P', 'P:w<CR>', opts},
    {'<Esc>', '<Esc>:w<CR>', opts},

    {'Q', ':q<CR>', opts},

    {'<leader>;', 'A;<Esc>', {}},
    {'<leader>lt', ':!pdflatex main.tex<Cr><Cr>', {}},
    {'<leader>rr', ':source ~/.config/nvim/init.lua<CR>', {}},
    {'<leader>e', ':NvimTreeToggle<CR>', {}},
    {'<leader>u', ':UndotreeToggle<CR>:UndotreeFocus<CR>', {}},
    {'<leader>t', ':tabnew <CR>', {}},

    {'<CR>', 'o<Esc>', {}},

    {'<leader>h', ':wincmd h<CR>', {}},
    {'<leader>j', ':wincmd j<CR>', {}},
    {'<leader>k', ':wincmd k<CR>', {}},
    {'<leader>l', ':wincmd l<CR>', {}},

    {'<leader>gt', ':lua vim.lsp.buf.definition()<CR>', opts},
    {'<leader>gd', ':lua vim.lsp.buf.implementation()<CR>', opts},
    {'<leader>do', ':lua vim.lsp.buf.hover()<CR>', opts},
    {'<leader>ga', ':lua vim.lsp.buf.code_action()<CR>', opts},
    {'<leader>dj', ':lua vim.diagnostic.goto_next()<CR>', opts},
    {'<leader>dk', ':lua vim.diagnostic.goto_prev()<CR>', opts},
    {'<leader>dk', ':lua vim.diagnostic.goto_prev()<CR>', opts},

    {'<leader>rn', ':IncRename ', opts},

    {'<leader>T', ':Telescope ', opts},

    {'J', 'mzJ`z', opts},

    {'=', 'mzgg=G`zzz', opts},
    {'m', ']m', {}},
    {'M', '[m', {}},
}

for i = 1, #nmaps do
    keymap('n', nmaps[i][1], nmaps[i][2], nmaps[i][3])
end

-- Gambiarra Telescope 
local builtin = require "telescope.builtin"
local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

local tmaps = {

    {'n', '<A-[>', builtin.current_buffer_fuzzy_find, {}},
    {'n', '<A-]>', builtin.treesitter, {}},
    {'n', '<A-f>', builtin.fd, {}},
    {'n', '<A-h>', builtin.command_history, {}},
    {'v', '<A-h>', builtin.command_history, {}},
    {'n', '<A-r>', builtin.grep_string, {}},
    {'n', '<A-u>', builtin.live_grep, {}},
    {'n', '<A-o>', builtin.git_files, {}},
    {'n', '<A-b>', builtin.buffers, {}},
    {'n', '<A-p>', ":lua require('telescope').extensions.neoclip.default()<CR>", {}},
    {'n', '<A-w>', builtin.live_grep, {}},

    {'v', 'J', ":m '>+1<CR>gv=gv", {}},
    {'v', 'K', ":m '<-2<CR>gv=gv", {}},

    {'n', '<A-a>', mark.add_file, {}},

    {'n', '<A-e>', ui.toggle_quick_menu, {}},

    {'n', '<A-j>', function() ui.nav_file(1) end, {}},
    {'n', '<A-k>', function() ui.nav_file(2) end, {}},
    {'n', '<A-l>', function() ui.nav_file(3) end, {}},
    {'n', '<A-;>', function() ui.nav_file(4) end, {}},

    {'n', '<leader>g', vim.cmd.Git, {}},
    {'n', '<A-g>', ':Copilot panel<CR>', {}},

    {'n', '<A-t>', copilot_toggle_active, {}},
    {'i', '<A-t>', copilot_toggle_active, {}},

    {'i', '<C-a>', ":copilot#Accept('\\<CR>')<CR>", {silent = true}},
}


for i = 1, #tmaps do
    vim.keymap.set(tmaps[i][1], tmaps[i][2], tmaps[i][3], tmaps[i][4])
end

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'Visual', timeout = 100 }
    end,
})

vim.g.copilot_no_tab_map = true

vim.cmd[[
imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
]]

