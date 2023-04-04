vim.cmd[[
    augroup AutoSaveFolds
      autocmd!
      autocmd BufWinLeave *.c,*.cpp,*.h,*.java,*.py,*.js,*.ts,*.php,*.rb,*.go,*.lua,*.rs mkview
      autocmd BufWinEnter *.c,*.cpp,*.h,*.java,*.py,*.js,*.ts,*.php,*.rb,*.go,*.lua,*.rs silent loadview
    augroup END
]]
