" Movement definitions
" exit Insert mode by pressing 'jk'
imap jk <Esc>

" Managing splits
set splitright " open new window on the right v-split
set splitbelow " open new window below when h-split
" move between splits with Ctrl + hjkl
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" move between tabs with F7 and F8
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" Split appearance
set number " view absolute line numbers
set relativenumber " view relative line numbers up/down based on cursor position
set tabstop=4 shiftwidth=4 expandtab

" Plug
" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
" Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
Plug 'janko-m/vim-test'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript'
Plug 'glench/vim-jinja2-syntax'
Plug 'valloric/matchtagalways'
" Plug 'latex-box-team/latex-box'
Plug 'fisadev/vim-isort'
Plug 'lervag/vimtex'
" Python specific
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-scripts/sh.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

Plug 'Chiel92/vim-autoformat'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" colors
set termguicolors
colorscheme vividchalk
colorscheme PaperColor
highlight clear SignColumn

" File specific settings
syntax on
filetype plugin indent on

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
" First letter of runner's name must be uppercase
let test#runners = {'Python': ['pytest']}
let test#strategy = "neovim"

" syntastic
" let g:syntastic_python_checkers = ['flake8', 'pylint']

" neoformat
augroup fmt
    autocmd!
    " autocmd BufWritePre *.py :! isort --atomic %
    autocmd BufWritePre *.py :Isort
    autocmd BufWritePre *.py undojoin | Neoformat! python black
augroup END

" neomake
call neomake#configure#automake({
            \   'TextChanged': {},
            \   'InsertLeave': {},
            \   'BufWinEnter': {'delay': 0},
            \ }, 500)

highlight NeomakeWarningSign ctermfg=11
highlight NeomakeWarning ctermfg=11
let g:neomake_warning_sign={'text': '!', 'texthl': 'NeomakeWarningSign'}

let g:neomake_python_flake8_maker = {
    \ 'args': ['--max-line-length=88'],
    \ }
    " \ 'errorformat':
    "     \ '%E%f:%l: could not compile,%-Z%p^,' .
    "     \ '%A%f:%l:%c: %t%n %m,' .
    "     \ '%A%f:%l: %t%n %m,' .
    "     \ '%-G%.%#',
let g:neomake_python_enabled_makers = ['flake8', 'mypy']
" When writing a buffer (no delay).

" Python specifics
" set a breakpoint
au FileType python map <silent> <leader>b oimport pudb; pudb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pudb; pudb.set_trace()<esc>
autocmd BufRead,BufNewFile *.python setlocal filetype=python
autocmd BufRead,BufNewFile *.py setfiletype python

" HTML specifics
autocmd FileType html setlocal shiftwidth=4 softtabstop=4 expandtab
" Plug additional settings
" Jinja2
autocmd BufRead,BufNewFile *.j2 setfiletype jinja
autocmd FileType jinja setlocal commentstring={#\ %s\ #}
" vim-gitgutter
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
filetype plugin on

" Haskell
" opening *.hs files can be slow due to stack doing something
" let g:neomake_haskell_enabled_makers = []

""" BLOCK
" https://pastebin.com/f2ee37c92
" searching for dup lines
" * and # search for next/previous of selected text when used in visual mode
xno * :<c-u>cal<SID>VisualSearch()<cr>/<cr>
xno # :<c-u>cal<SID>VisualSearch()<cr>?<cr>

fun! s:VisualSearch()
    let old = @" | norm! gvy
    let @/ = '\V'.substitute(escape(@", '\'), '\n', '\\n', 'g')
    let @" = old
endf
""" ENDBLOCK
