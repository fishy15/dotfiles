vim.cmd('source ~/.config/nvim/config.vim')

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.cinoptions = "j1,(0,ws,Ws"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- vim.opt.updatetime = 100

-- enable using mouse
vim.opt.mouse = "a"

-- get c/c++ specific config settings
require('cpp')

-- indentation setup
require('ibl').setup {
    indent = { char = "┆" },
    scope = { enabled = false },
}

local hooks = require "ibl.hooks"
hooks.register(
    hooks.type.WHITESPACE,
    hooks.builtin.hide_first_space_indent_level
)

-- colorscheme setup
require('catppuccin').setup {
    default_integrations = true,
    integrations = {
        gitgutter = true,
    },
    custom_highlights = function(colors)
        return {
            CursorLine = {
                bg = colors.mantle,
            }
        }
    end
}

require('lualine').setup {
    options = {
        theme = 'catppuccin',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', {'fileformat', icons_enabled = false}, 'filetype'},
        lualine_y = {'searchcount', 'progress'},
        lualine_z = {'location'},
    },
}

vim.cmd.colorscheme "catppuccin"

vim.g.gitgutter_enabled = true

vim.g.ale_linters = {
    cpp = {'g++'},
}
vim.g.ale_cpp_cc_executable = 'g++'
vim.g.ale_cpp_cc_options = '-O2 -Wall -std=c++20'

vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_quickfix_mode = 0
