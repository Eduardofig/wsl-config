-- keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

require("treesj").setup({
    use_default_keymaps = false,
})

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
    --[[ {'<leader>lt', ':!pdflatex main.tex<Cr><Cr>', {}}, ]]
    {'<leader>rr', ':source ~/.config/nvim/init.lua<CR>', {}},
    {'<leader>e', ':NvimTreeToggle<CR>', {}},
    {'<leader>u', ':UndotreeToggle<CR>:UndotreeFocus<CR>', {}},
    {'<leader>t', ':tabnew <CR>', {}},

    {'<CR>', 'o<Esc>', {}},

    {'<leader>h', ':wincmd h<CR>', {}},
    {'<leader>j', ':wincmd j<CR>', {}},
    {'<Space>j', ':wincmd j<CR>', {}},
    {'<leader>k', ':wincmd k<CR>', {}},
    {'<leader>l', ':wincmd l<CR>', {}},

    {'gt', ':TroubleToggle lsp_definitions<CR>', opts},
    {'g[', ':Gvdiffsplit<CR>', opts},
    {'gd', ':TroubleToggle lsp_references<CR>', opts},
    {'do', ':lua vim.lsp.buf.hover()<CR>', opts},
    {'ga', ':CodeActionMenu<CR>', opts},
    {'gj', ':lua vim.diagnostic.goto_next()<CR>', opts},
    {'gk', ':lua vim.diagnostic.goto_prev()<CR>', opts},
    {'gh', ':TroubleToggle lsp_type_definitions<CR>', opts},
    {'go', ':TroubleToggle workspace_diagnostics<CR>', opts},
    { 'gf', ':lua vim.lsp.buf.format({async = true})<CR>', opts },

    { '<leader>M', ":lua require('treesj').toggle({ split = { recursive = true } }) <CR>", opts },
    { '<leader>m', ":lua require('treesj').toggle()<CR>", opts },

    {'<leader>rn', ':IncRename ', opts},

    {'<leader>T', ':Telescope ', opts},

    {'J', 'mzJ`z', opts},

    {'=', 'mzgg=G`zzz', opts},
    { 'm', ']m', {}},
    {'M', '[m', {}},

    -- dap keymaps
    {'<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", opts},
    {'<leader>B',":lua require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) <CR>", opts},
    {'<leader>so', ":lua require'dap'.step_over()<CR>", opts},
    {'<leader>si', ":lua require'dap'.step_into()<CR>", opts},
    {'<leader>su', ":lua require'dap'.step_out()<CR>", opts},
    {'<leader>sc', ":lua require'dap'.continue()<CR>", opts},
    {'<leader>sr', ":lua require'dap'.restart_frame()<CR>", opts},
    {'<leader>st', ":lua require'dap'.terminate()<CR>", opts},
    {'<leader>dr', ":lua require'dap'.repl.open()<CR>", opts},

    -- rest keymaps
    {'<leader>xr', ":call VrcQuery()<CR>", opts},
}

for i = 1, #nmaps do
    keymap('n', nmaps[i][1], nmaps[i][2], nmaps[i][3])
end

-- Gambiarra Telescope 
local builtin = require "telescope.builtin"
local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

local tmaps = {

    {'n', '<A-a>', builtin.fd, {}},
    {'n', '<A-o>', builtin.current_buffer_fuzzy_find, {}},
    {'n', '<A-e>', builtin.treesitter, {}},
    {'n', '<A-u>', builtin.live_grep, {}},
    {'n', '<A-h>', builtin.command_history, {}},
    {'n', '<A-r>', builtin.grep_string, {}},
    {'n', '<A-[>', builtin.git_files, {}},
    {'n', '<A-b>', builtin.buffers, {}},
    {'n', '<A-y>', ":lua require('telescope').extensions.neoclip.default()<CR>", {}},

    {'v', 'J', ":m '>+1<CR>gv=gv", {}},
    {'v', 'K', ":m '<-2<CR>gv=gv", {}},

    {'n', '<A-f>', mark.add_file, {}},

    {'n', '<A-l>', ui.toggle_quick_menu, {}},

    {'n', '<A-p>', function() ui.nav_file(1) end, {}},
    {'n', '<A-.>', function() ui.nav_file(2) end, {}},
    {'n', '<A-,>', function() ui.nav_file(3) end, {}},
    {'n', '<A-;>', function() ui.nav_file(4) end, {}},

    {'n', '<leader>g', vim.cmd.Git, {}},
    {'n', '<A-g>', ':Copilot panel<CR>', {}},

    {'n', '<A-t>', copilot_toggle_active, {}},

    {'i', '<C-a>', ":copilot#Accept('\\<CR>')<CR>", {silent = true}},
    {'i', '<C-r>', "<Plug>(copilot-next)", {}},
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
imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
]]
