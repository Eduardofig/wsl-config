-- appearance
vim.cmd("colorscheme tokyonight")
vim.cmd("hi Normal guibg=none")
vim.cmd("hi NormalNC guibg=none")
--[[ vim.cmd("hi NormalFloat guibg=none") ]]
vim.cmd("hi FloatBorder guibg=None")
vim.cmd("hi clear SignColumn")
vim.cmd("hi clear SignColumn")
vim.cmd("hi clear TabLineFill")
vim.cmd("hi clear VertSplit")
vim.cmd("hi clear Tabline")
vim.cmd("hi Pmenu guibg=#161929")
vim.cmd("hi DiagnosticVirtualTextInfo guibg=None")
vim.cmd("hi DiagnosticVirtualTextError guibg=None")
vim.cmd("hi DiagnosticVirtualTextWarn guibg=None")
vim.cmd("hi DiagnosticVirtualTextHint guibg=None")
vim.cmd("hi DiagnosticVirtualTextHint guibg=None")
vim.cmd("hi @type.builtin guifg=#ad345c")
vim.cmd("hi @type guifg=#ad345c")
vim.cmd("hi @parameter guifg=#29a4bd")
vim.cmd("hi NvimTreeNormal guibg=None ctermbg=None")
vim.cmd("hi NvimTreeNormalNC guibg=None ctermbg=None")
vim.cmd("hi NvimTreeWinSeparator guibg=None ctermbg=None")
vim.cmd("hi TelescopeNormal guibg=None")
vim.cmd("hi TelescopeBorder guibg=None")
vim.cmd("hi TreesitterContext guibg=None")
vim.cmd("hi TreesitterContextBottom guibg=None")
vim.cmd("hi NormalFloat guibg=None")
vim.cmd("hi CopilotSuggestion guibg=None guifg=#565f89")
vim.cmd("hi Folded guibg=None")
vim.cmd("hi Pmenu guifg=#33328b guibg=None")
vim.cmd("hi FloatBorder guifg=#33328b guibg=None")
vim.cmd("hi PmenuSel guibg=#232748")
vim.cmd("hi TelescopeSelection guibg=#232748")
vim.cmd("hi Visual guibg=#232748")
vim.cmd("hi TroubleNormal guibg=None")
vim.cmd("hi CodeActionMenuSelection guibg=#232748")
vim.cmd("hi TroublePreview guibg=#232748")
vim.cmd("hi CodeActionMenuMenuSelection guibg=#232748")
vim.cmd("hi Comment gui=none cterm=none guifg=#565f89")
vim.cmd("hi @keyword gui=none cterm=none guifg=#9d7cd8")
vim.cmd("hi @lsp.type.parameter guifg=#29a4bd")

require'colorizer'.setup()
require'todo-comments'.setup({
    highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "fg", -- "fg" or "bg" or empty
        keyword = "wide_bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS):\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
    },
    gui_style = {
        bg = "NONE",
        fg = "NONE",
    }
})

-- Hide all semantic highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    -- if group is different @lsp.type.parameter set hl to 0
    if group ~= "@lsp.type.parameter" then
        vim.api.nvim_set_hl(0, group, {})
    end

end


require('tokyonight').setup ({
    styles = {
        comments = {italic = false},
        keywords = {italic = false},
        functions = {italic = false},
        priority = 10,
    }
})
