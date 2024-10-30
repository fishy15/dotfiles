" folding set up (for cpp)
autocmd BufRead *.cpp exe 'set foldmethod=indent'
autocmd BufRead *.cpp exe 'set foldlevel=0'
autocmd BufRead *.cpp exe 'set foldnestmax=1'
" autocmd BufRead *.cpp exe 'highlight Folded ctermbg=NONE'

" folding set up (for java)
autocmd BufRead *.java exe 'set foldmethod=indent'
autocmd BufRead *.java exe 'set foldlevel=1'
autocmd BufRead *.java exe 'set foldnestmax=2'

" unfolds everything when file is read
autocmd BufRead * normal zR

" autocomplete braces etc. on next line
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o>0<tab>
inoremap (<cr> (<cr>)<c-o>0<tab>

tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <Esc> <C-\><C-n>

" Switch between tabs easier
nnoremap H gT
nnoremap L gt

" " en markdown files while editing them
" aucmd BufEnter *.md exe 'noremap <F9> :w<enter>:!open -na "/Applications/Google Chrome.app" --args --new-window %:p<CR> <CR>'

" Plugin stuff
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
" Plug 'yggdroot/indentline'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'NLKNguyen/papercolor-theme'
Plug 'lervag/vimtex'
Plug 'Fildo7525/pretty_hover'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'benknoble/vim-racket'
call plug#end()

set termguicolors
colorscheme PaperColor

let g:airline#extensions#whitespace#checks = ['indent', 'long', 'mixed-indent-file', 'conflicts' ]
let g:airline_solarized_bg='dark'
let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1

let g:gitgutter_enabled=1

let g:ale_linters = {'cpp': ['g++']}
let g:ale_cpp_cc_executable = 'g++'
let g:ale_cpp_cc_options = '-O2 -Wall -std=c++17'

let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0

