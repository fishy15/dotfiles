filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

set number
set relativenumber

set updatetime=100

" folding set up
set foldmethod=indent
set foldlevel=0
set foldnestmax=1
highlight Folded ctermbg=NONE

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

" Open markdown files while editing them
autocmd BufEnter *.md exe 'noremap <F9> :w<enter>:!open -na "/Applications/Google Chrome.app" --args --new-window %:p<CR> <CR>'

" Make sure concealing is not on same line as cursor in LaTeX
autocmd BufEnter *.tex exe ":set cocu="

" Compile and open LaTeX files while editing them
autocmd BufEnter *.tex exe 'noremap <F9> :w <enter>:!pdflatex %:r.tex ; open %:r.pdf<CR>'

" Plugin stuff
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
" Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

set t_Co=256
colorscheme PaperColor
set background=dark

let g:airline#extensions#whitespace#checks = ['indent', 'long', 'mixed-indent-file', 'conflicts' ]
" let g:airline_solarized_bg='dark'
let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1
let g:gitgutter_enabled=1

let g:indentLine_char='┆'

let g:ale_linters = {'cpp': ['clang', 'g++']}
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'
