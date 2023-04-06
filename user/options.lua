-- options
local options = {
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    exrc = true,
    relativenumber = true,
    hlsearch = false,
    hidden = true,
    errorbells = false,
    nu = true,
    wrap = false,
    ignorecase = true,
    smartcase = true,
    backup = false,
    undodir = '~/.vim/undodir',
    undofile = true,
    incsearch = true,
    termguicolors = true,
    showmode = false,
    mouse = 'a',
    clipboard = 'unnamedplus',
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.mapleader = " "

vim.cmd[[
    augroup NoAutoComment
        au!
        au FileType * setlocal formatoptions-=cro
    augroup end
]]
