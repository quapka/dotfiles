set runtimepath+=~/.nvim/after
" source vundle
source ~/.vundle_conf.vim
" colors and syntax highlight
" so ~/.syntax.vim
set tags=./._tags;

set encoding=utf-8 " the encoding displayed
set fileencoding=utf-8 " the encoding written to file


" syntax enable
" set background=dark
" colorscheme solarized

" highlightning files
" filetype plugin on

" indentation
" set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
" enable mouse
set mouse=a

filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.dot normal gg=G

set splitright " open new window on the right v-split
set splitbelow " open new window below when h-split

" go to Esc mode on pressing j and k
imap jk <Esc>
" and in neovim terminal mode as well
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
" nnoremap <silent> <F8> :w<cr>!clear;python %<cr>" run python file
nnoremap <C-Left> :tabprevious<cr>
nnoremap <C-Right> :tabnext<cr>

" window minimal height
" set wh=23
set wmh=0
" moving between splits, there is also <C-W>_
map <C-J> <C-W>j
map <C-K> <C-W>k

" window minimal width
set wmw=0
" moving between splits
map <C-H> <C-W>h
map <C-L> <C-W>l

" match extra white space
highlight ExtraWhitespace ctermbg=blue guibg=blue
match ExtraWhitespace /\s\+$\n/
autocmd BufWinEnter * match ExtraWhitespace /\s\+a$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" EXAMPLE extra white space

" playing with higlightning tabs
" set list
" set listchars=tab:>·
"hi GroupA ctermbg=blue ctermfg=black
"hi GroupB ctermbg=gray ctermfg=black
"match GroupA / \+$/
"match GroupB /\t/
" hi TabularSpace ctermfg=201 ctermbg=0
" match TabularSpace /\t/
"something
"highlight LeadingWhiteSpace ctermbg=blue ctermfg=red
"match LeadingWhiteSpace /^ \+/

" highlight leading spaces
"set listchars=space:·
"highlight WhiteSpaceMol ctermbg=black ctermfg=black
"match WhiteSpaceMol /\ /
highlight LeadingWhiteSpace ctermbg=blue ctermfg=blue
match LeadingWhiteSpace /^ \+/

" view absolute line numbers
set number
" view relative line numbers up/down based on cursor position
set relativenumber

" automatic highlightning for shpaml files
" maybe better to be put in different file
autocmd BufRead,BufNewFile *.shpaml setfiletype htmldjango
autocmd FileType htmldjango setlocal commentstring=\{#\ %s\ #\}

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

""" BLOCK
" kudos to https://unix.stackexchange.com/a/104931
" %F(Full file path)
" %m(Shows + if modified - if not modifiable)
" %r(Shows RO if readonly)
" %<(Truncate here if necessary)
" \ (Separator)
" %=(Right align)
" %l(Line number)
" %v(Column number)
" %L(Total number of lines)
" %p(How far in file we are percentage wise)
" %%(Percent sign)
" set statusline=%F%m%r%<\ %=%l,%v\ [%L]\ %p%%

" Change the highlighting so it stands out
" hi statusline ctermbg=white ctermfg=black

" Make sure it always shows
set laststatus=2
""" ENDBLOCK


"map switching between tabs
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" display current time
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

" automatic reload of changes in .vimrc upon saving
" https://superuser.com/questions/132029/how-do-you-reload-your-vimrc-file-without-restarting-vim
" here

" colorschema for windows tabs
" https://stackoverflow.com/questions/7238113/customising-the-colours-of-vims-tab-bar
" hi TabLineSel ctermbg=blue
"
" python and neovim
" let g:loaded_python_provider=1
" let g:loaded_python3_provider=1

" setting breakpoints with <leader>b <leader>B
au FileType python map <silent> <leader>b oimport pudb; pudb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pudb; pudb.set_trace()<esc>

autocmd BufRead,BufNewFile *.python setlocal filetype=python
autocmd BufRead,BufNewFile *.py setfiletype python

" vim-close tags
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.shpaml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is '<leader>>'
"
let g:closetag_close_shortcut = '<leader>>'

" When writing a buffer (no delay).
call neomake#configure#automake('w')
" " When writing a buffer (no delay), and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)
" " When reading a buffer (after 1s), and when writing (no delay).
" call neomake#configure#automake('rw', 1000)
" " Full config: when writing or reading a buffer, and on changes in insert and
" " normal mode (after 500ms; no delay when writing).
" call neomake#configure#automake('nrwi', 500)

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
let g:neomake_python_enabled_makers = ['flake8']
" When reading a buffer (after 2s), and when writing.
" call neomake#configure#automake('rw', 1000)

" vim-airline settings
autocmd User AirlineToggledOn call SetStatus()
function! SetStatus()
    if ( &ft == 'py' || &ft == 'python')
        set colorcolumn=10
        " let g:airline_section_x = 'something'
    endif
endfunction

" direnv uses .envrc files
autocmd BufRead,BufNewFile .envrc setlocal filetype=sh
autocmd BufRead,BufNewFile .envrc setlocal syntax=sh

autocmd BufRead,BufNewFile .svm setlocal filetype=svm
autocmd BufRead,BufNewFile .svm setlocal syntax=svm

let g:go_version_warning = 0
let g:vim_isort_python_version = 'python3'

augroup autoformat_settings
    " autocmd FileType bzl AutoFormatBuffer buildifier
    " autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
    " autocmd FileType dart AutoFormatBuffer dartfmt
    " autocmd FileType go AutoFormatBuffer gofmt
    " autocmd FileType gn AutoFormatBuffer gn
    " autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf3
    " Alternative: autocmd FileType python AutoFormatBuffer autopep8
    " autocmd FileType vue AutoFormatBuffer prettier
augroup END

" 'autoformat' package settings
" autocmd BufWrite * :Autoformat
" let g:formatter_yapf_style = 'pep8'
augroup fmt
    autocmd!
    autocmd BufWritePre *.py undojoin | Neoformat! python black
augroup END

" autocmd BufWritePost *.xml %!xmllint --format --recover - 2>/dev/null
" autocmd Filetype ruby call SetRubyOptions()
function TidyXML()
    %!tidy -xml -q --show-errors 0 --show-warnings 0 --indent-attributes 1 -indent --indent-spaces 4
endfunction
" autocmd BufWritePost *.xml %!tidy -xml -q --show-errors 0 --show-warnings 0 --indent-attributes 1 -indent --indent-spaces 4
autocmd BufWritePost *.xml call TidyXML()

" source ~/.vim/bundle/setcolors/plugin/setcolors.vim
" let g:gitgutter_set_sign_backgrounds = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
" call gitgutter#highlight#define_highlights()
" colorscheme Backupslate2
