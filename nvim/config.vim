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
Plug 'nvim-lualine/lualine.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'lervag/vimtex'
Plug 'Fildo7525/pretty_hover'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'benknoble/vim-racket'
call plug#end()
