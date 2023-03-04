-- keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

local imaps = {
    {'<C-f>', '<Plug>(coc-snippets-expand)', {}},
    {'<C-l>', '<Esc>viw~ea', {}},
    {'<C-o>', '<Esc>A;<CR>', {}},
    {'<C-j>', '<C-n>', opts},
    {'<C-k>', '<C-p>', opts},
}

for i = 1, #imaps do
    keymap('i', imaps[i][1], imaps[i][2], imaps[1][3])
end

local nmaps = {
    {'<leader>;', 'A;<Esc>', {}},
    {'<leader>lt', ':!pdflatex main.tex<Cr><Cr>', {}},
    {'<leader>rr', ':source ~/.config/nvim/init.lua<CR>', {}},
    {'<leader>e', ':NvimTreeToggle<CR>', {}},
    {'<leader>t', ':tabnew <CR>', {}},
    {'<CR>', 'o<Esc>', {}},
    -- {'<leader>gt', ':call CocAction(\'jumpDefinition\')<CR>', {}},
    -- {'<leader>gd', ':call CocAction(\'jumpDefinition\', \'split\')<CR>', {}},
    -- {'<leader>gv', ':call CocAction(\'jumpDefinition\', \'vsplit\')<CR>', {}},
    -- {'<leader>e', ':CocCommand explorer<CR>', {}},
    -- {'<leader>ff', ':Files<CR>', {}},
    -- {'<leader>fr', ':Rg<CR>', {}},
    --{'/', ':BLines<CR>', {}},
    -- {'<leader>fa', ':Ag<CR>', {}},
    -- {'<leader>fi', ':History:<CR>', {}},
    -- {'<leader>fl', ':Lines<CR>', {}},
    -- {'<leader>m', ':MaximizerToggle!<CR>', {}},
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

    -- {'<leader>do', ':call CocAction(\'doHover\')<CR>', opts},
    -- {'<silent> <space><space>', ':<C-u>CocFzfList<CR>', opts},
}

for i = 1, #nmaps do
    keymap('n', nmaps[i][1], nmaps[i][2], nmaps[i][3])
end

