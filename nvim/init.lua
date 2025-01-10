vim.cmd('source ~/.config/nvim/config.vim')

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.cinoptions = "j1,(0,ws,Ws"

vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.updatetime = 100

-- enable using mouse
vim.opt.mouse = "a"

vim.opt.background = "dark"
vim.cmd.colorscheme "catppuccin"

-- get c/c++ specific config settings
require('cpp')
require('ibl').setup {
    indent = { char = "┆" },
}

local hooks = require "ibl.hooks"
hooks.register(
    hooks.type.WHITESPACE,
    hooks.builtin.hide_first_space_indent_level
)
