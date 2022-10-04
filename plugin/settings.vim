" ----- default settings ------------------------------------------------------
" encoding
set encoding=utf8

" disable mouse support
set mouse=

" tabs to spaces
set expandtab 
set shiftround 
set tabstop=2 
set shiftwidth=2

" line numbering
set number
if exists('+relativenumber')
  set relativenumber
endif

" auto balance vim pane if window has changed size
autocmd VimResized * :wincmd =

" live preview of :s command
if exists('&inccommand')
  set inccommand=split
endif

" 3 line buffer for scrolling up and down
set scrolloff=3

" splits
if has('windows')
  set splitbelow
endif
if has('vertsplit')
  set splitright
endif

" persistent undo - keep undo history even if buffer changes
if has('persistent_undo')
  let &undodir=expand($CONFPATH . '/tmp/undo')
  set undodir+=.
  set undofile
endif

" set swap files in tmp directory - keep them out of the way
let &directory=expand($CONFPATH . '/tmp/swap//')
set directory+=.

" allow cursor to move to where these is no text in visual block
set virtualedit=block

" ignore case of normal letters
set ignorecase

" search
set smartcase " override ignorecase if search include upper case characters
set incsearch " enabable incremental search
set hlsearch " highlight search pattern on all buffers
set wrapscan " search wraps around the end of file

" git diff options
set diffopt+=iwhite " ignore white space
set diffopt+=vertical " open in vertical splits

" use guifg/guibg instead of ctermfg/ctermbg in terminal, true colors
if has('termguicolors')
  set termguicolors
endif


