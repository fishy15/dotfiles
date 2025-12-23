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

vim.g.mapleader = ' '

vim.opt.mouse = "a"

-- buffer navigation
vim.api.nvim_set_keymap('n', '<leader>l', ':ls<CR>:b<space>', {noremap = true})

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

vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_quickfix_mode = 0

-- LSP configuration
require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = { 'clangd' },
}

-- must be before `require('coq')`
vim.g.coq_settings = {
    auto_start = 'shut-up',
    display = {
        icons = {
            mode = 'none',
        },
        pum = {
            y_max_len = 8,
        }
    },
    clients = {
        snippets = {
            warn = {},
        }
    }
}

local lsp = vim.lsp.config
local coq = require('coq')

local configs = {
    ["clangd"] = {
        "clangd",
        "--background-index",
        -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
        -- to add more checks, create .clang-tidy file in the root directory
        -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
        "--clang-tidy",
        "--completion-style=bundled",
        "--cross-file-rename",
        -- "--header-insertion=never",
    },
    ["ocamllsp"] = {
        cmd = { 'ocamllsp' },
        autostart = true,
        filetypes = { 
            'ocaml',
            'ocaml.interface',
            'ocaml.menhir',
            'ocaml.ocamllex',
            'dune',
            'reason'
        },
        root_markers = {
            { 'dune-project', 'dune-workspace' },
            { "*.opam", "esy.json", "package.json" },
            '.git'
        },
        settings = {},
    },
    ["basedpyright"] = {
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "standard",
                },
            },
        },
    },
    ["vtsls"] = {
        settings = {
            typescript = {
                inlayHints = {
                    parameterNames = { enabled = "literals" },
                    parameterTypes = { enabled = true },
                    variableTypes = { enabled = true },
                    propertyDeclarationTypes = { enabled = true },
                    functionLikeReturnTypes = { enabled = true },
                    enumMemberValues = { enabled = true },
                },
            },
        },
    },
    ["rust_analyzer"] = {},
}

for name, config in pairs(configs) do
    vim.lsp.config(name, coq.lsp_ensure_capabilities { config })
    vim.lsp.enable(name)
end

vim.lsp.inlay_hint.enable(true)

require('guess-indent').setup {
    auto_cmd = true,
    ignore_editorconfig = false,
}

vim.diagnostic.enable = true
vim.diagnostic.config({
    virtual_text = true,
})
