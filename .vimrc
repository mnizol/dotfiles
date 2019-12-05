" Plugins
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'drewtempelmeyer/palenight.vim' 
call plug#end()

" Set-up behavior for .todo files 
autocmd BufRead,BufNewFile *.todo call SetTodoFileOptions()

function SetTodoFileOptions()
    setlocal foldlevel=0
    setlocal foldmethod=indent
    setlocal foldminlines=0
endfunction

" Configure NERDTree file manager
autocmd VimEnter * NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowExpandable=">"
let NERDTreeDirArrowCollapsible="v"

" Bufferline plugin
let g:bufferline_echo = 0

" Set-up basic editing environment
set nu     " Line numbers
set nowrap " Line wrapping

" Tabs
set sw=4
set tabstop=4
set expandtab

" Color schemes
set background=dark
colorscheme palenight

" Windows clipboard mappings
map <C-V> "+gP
