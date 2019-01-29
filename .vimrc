""" execute pathogen#infect()
""" syntax on
""" filetype plugin indent on

call plug#begin('~/.vim/plugged')
" File structure and viewer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" tmux with VIM
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript']}

" HTML plugin emmet
Plug 'mattn/emmet-vim'

"Expanded git functionality
Plug 'tpope/vim-fugitive'

" Javascript syntax highlighter
Plug 'jelera/vim-javascript-syntax'

" Make indentation more clear
Plug 'Yggdroot/indentLine'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Multiple cursors support
Plug 'terryma/vim-multiple-cursors'

" JSX highlighter
Plug 'mxw/vim-jsx'

" Code Snippets plugin and library
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'

" Javascript bundle
Plug 'pangloss/vim-javascript'

" Cool color scheme
Plug 'altercation/vim-colors-solarized'

" Text completer
Plug 'Valloric/YouCompleteMe'

" Fancy vim status bar
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'

" Linter
Plug 'w0rp/ale'

" Easy commenting
Plug 'scrooloose/nerdcommenter'

" Back to basics
Plug 'tpope/vim-sensible'

" Rails stuff
Plug 'tpope/vim-rails'

" Ruby stuff
Plug 'vim-ruby/vim-ruby'

" Improved text editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

call plug#end()

let mapleader=","

syntax on
syntax enable
filetype plugin indent on
filetype plugin on
filetype on
""" Solarized settings
set background=dark
colorscheme solarized
"""

let g:indentLine_char = '|'
let g:indentLine_conceallevel = 1

" Make backspace work
set backspace=indent,eol,start

set number
set mouse=a
set cindent
set hlsearch
set incsearch
"set laststatus
"set statusline+=%F

" Turn off the swapfiles
set nobackup
set nowritebackup
set noswapfile

" crtl-direction navigate between vim panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" mapping fuzzyfinder to ctrl-p
nnoremap <C-p> :FZF<CR>

" Convenience
nmap ,a :wa<CR>
nmap ,q :q<CR>
nmap ,nt :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>
nmap ,e :e#<CR>

""" Clipboard
" copy highlighted to clipboard
vmap ,c "*y
" copy word to clipboard
nmap ,d "*yiw
" paste
nmap ,v :set paste<CR>"*p:set nopaste<CR>

" Fixing ycm python 3.7 warning
silent! py3 pass

" Youcompleteme gutter stays open at all times
"let g:gitgutter_sign_column_always = 1
"set signcolumn="yes"
"^ didn't work so adding dummy sign
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" attempt to get rid of sign bar in nerdtree
autocmd BufEnter NERD_tree_* let g:quickfixsigns#marks#buffer = []
autocmd CursorHold NERD_tree_* let g:quickfixsigns#marks#buffer = []

" UltiSnips changing tab expansion key
let g:UltiSnipsExpandTrigger="<c-t>"

" Ale Settings and linters
let g:airline#extensions#ale#enable = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = { 'javascript': ['eslint'], 'jsx': ['eslint']  }
let g:ale_javascript_eslint_use_global = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1

" JSX highlighting in other file types than .jsx
let g:jsx_ext_required = 0

" Standard js style on save
" autocmd bufwritepost *.js silent !standard --fix %
" set autoread

nnoremap <leader>s :ALENextWrap<CR>

autocmd Filetype python set tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype ruby set expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html set tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascript set expandtab  tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype java set tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype yaml set expandtab tabstop=2 softtabstop=2 shiftwidth=2

" run last vimux command
map <Leader>rr :call VimuxRunLastCommand()<CR>
" run vimux command
map <Leader>rp :VimuxPromptCommand<CR>

map Y y$
