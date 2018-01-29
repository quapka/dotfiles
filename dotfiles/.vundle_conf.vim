set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
" Plugin 'scrooloose/syntastic'
Plugin 'neomake/neomake'
Plugin 'pangloss/vim-javascript'

Plugin 'mhartington/oceanic-next'
" Plugin 'w0rp/ale'
" Plugin 'klen/python-mode'
" Plugin 'valloric/youcompleteme'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'alvan/vim-closetag'
Plugin 'janko-m/vim-test'
" vim-test
nmap <silent> <leader>t :TestNearest<CR>
" First letter of runner's name must be uppercase
let test#runners = {'Python': ['FabRunner']}
let test#python#runner = 'fabrunner'
let test#strategy = "neovim"


" Visual plugins
" Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
