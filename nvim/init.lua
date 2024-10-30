vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.cinoptions = "j1,(0,ws,Ws"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.updatetime = 100

-- enable using mouse
vim.opt.mouse = "a"

-- get c/c++ specific config settings
require('cpp')

vim.cmd('source ~/.config/nvim/config.vim')
