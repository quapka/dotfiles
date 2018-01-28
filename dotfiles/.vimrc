" source vundle
so ~/.vundle_conf.vim
" colors and syntax highlight
" so ~/.syntax.vim
set tags=./._tags;

" function UpdateTags()
"     let touce gfile = system('update-tags')
"     echo "Updated tags"
" endfunction

" function UpdateAllTags()
"     let tagfile = system('update-tags --all')
"     echo "Updated all tags"
" endfunction

" indentation
" set tabstop=4
set expandtab
set shiftwidth=2
set softtabstop=2

set splitright " new window open on the right

" go to Esc mode on pressing j and k
imap jk <Esc>
" nnoremap <silent> <F8> :w<cr>!clear;python %<cr>" run python file
nnoremap <C-Left> :tabprevious<cr>
nnoremap <C-Right> :tabnext<cr>

" window minimal height
set wmh=0
" moving between splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" window minimal width
set wmw=0
" moving between splits
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" highlightning files
"filetype on

" match extra white space
highlight ExtraWhitespace ctermbg=blue guibg=blue
match ExtraWhitespace /\s\+$\n/
autocmd BufWinEnter * match ExtraWhitespace /\s\+a$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" EXAMPLE extra white space		

" playing with higlightning tabs
set list
set listchars=tab:>·
"hi GroupA ctermbg=blue ctermfg=black
"hi GroupB ctermbg=gray ctermfg=black
"match GroupA / \+$/
"match GroupB /\t/
hi TabularSpace ctermfg=201 ctermbg=0
match TabularSpace /\t/
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
let g:loaded_python_provider=1
let g:loaded_python3_provider=1

" " python specific 
" if filetype == "py"
"   set colorcolumn=80
"   highlight ColorColumn ctermbg=darkgray
" endif
