vim.api.nvim_create_augroup("cpp", { clear = true })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    group = "cpp",
    pattern = { "*.c", "*.cxx", "*.cpp", "*.c++" },
    callback = function()
        vim.opt.foldmethod = "indent"
        vim.opt.foldlevel = 0
        vim.opt.foldnestmax = 1
    end
})