local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
    print("Colorscheme not found!")
    return
end

vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=#282C34
    augroup END
]])

vim.o.termguicolors = true
vim.cmd [[silent! colorscheme snow]]
