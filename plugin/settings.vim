" ---------- neovim settings --------------------------------------------------
" ----- encoding
set encoding=utf8

" ----- disable mouse
set mouse=

" ----- tabstop
set tabstop=4
set shiftwidth=4

" ----- line numbering
set number
set relativenumber

" ----- auto balance vim panes if window changes size
autocmd VimResized * :wincmd =

" ----- live preview of substitue command
set inccommand=split

" ----- 3 line buffer for scrolling up and down
set scrolloff=3

" ----- pane split direction
set splitbelow
set splitright

" ----- persistent undo
let &undodir=expand($CONFPATH . '/tmp/undo')
set undodir+=.
set undofile

" ----- swap file directory
let &directory=expand($CONFPATH . '/tmp/swap//')
set directory+=.

" ----- allow cursor to move to where there is no text in visual block
set virtualedit=block

" ----- ignore case of normal letters
set ignorecase

" ----- search
set smartcase
set incsearch
set hlsearch
set wrapscan

" ----- git diff options
set diffopt+=iwhite
set diffopt+=vertical

" ----- true colors
set termguicolors

" ----- conceal levels
set conceallevel=1
