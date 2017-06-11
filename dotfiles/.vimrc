" tabchar 5 spaces long
set tabstop=4
syntax enable
" set expandtab " probably better not to use this feature
set splitright " new window open on the right
imap jk <Esc> " goes to Esc mode on pressing j and k
nnoremap <silent> <F8> :w<cr>!clear;python %<cr>" run python file
nnoremap <C-Left> :tabprevious<cr>
nnoremap <C-Right> :tabnext<cr>

" highlightning files
"filetype on

" match extra white space
highlight ExtraWhitespace ctermbg=blue guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
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
highlight LeadingWhiteSpace ctermbg=blue ctermfg=red
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
set statusline=%F%m%r%<\ %=%l,%v\ [%L]\ %p%%

" Change the highlighting so it stands out
hi statusline ctermbg=white ctermfg=black

" Make sure it always shows
set laststatus=2
""" ENDBLOCK

""" source vundle
so ~/git/dotfiles/.vundle_conf.vim

"map switching between tabs
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" display current time
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

" automatic reload of changes in .vimrc upon saving
" https://superuser.com/questions/132029/how-do-you-reload-your-vimrc-file-without-restarting-vim
" here
