" tabchar 4 spaces long
set tabstop=4
syntax enable
set splitright " new window open on the right
imap jk <Esc> " goes to Esc mode on pressing j and k
nnoremap <silent> <F8> :w<cr>!clear;python %<cr>" run python file
nnoremap <C-Left> :tabprevious<cr>
nnoremap <C-Right> :tabnext<cr>

" match extra white space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()       

" playing with higlightning tabs
set list
set listchars=tab:>\ 
"hi GroupA ctermbg=blue ctermfg=black
"hi GroupB ctermbg=gray ctermfg=black
"match GroupA / \+$/
"match GroupB /\t/
hi TabularSpace ctermfg=201 ctermbg=016
match TabularSpace /\t/
		"something

" line numbers and stuff
set number
set relativenumber
