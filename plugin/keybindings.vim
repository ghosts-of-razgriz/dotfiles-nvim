" ----- key bindings ----------------------------------------------------------
" quit
nnoremap <silent><leader>q :quit<cr>
nnoremap <silent><localleader>q :quit!<cr>

" write
nnoremap <leader>w :write<cr>
nnoremap <localleader>w :write ! sudo tee %<cr>

" zoom
nnoremap <silent><leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <silent><leader>= :wincmd =<cr>

" split panes
nnoremap <localleader>\ :vsplit<cr>
nnoremap <localleader>- :split<cr>

" reload init file
nnoremap <localleader>r :source $MYVIMRC<cr>

" toggle search highlights
nnoremap <leader>h :set hlsearch!<cr>

" toggle paste mode
nnoremap <localleader>p :set paste!<cr>

" use jk to esc
inoremap jk <esc>

" next tab
nnoremap <silent><localleader>l :tabnext<cr>

" previous tab
nnoremap <silent><localleader>h :tabprevious<cr>

" new tab
nnoremap <silent><localleader><tab> :tabnew<cr>

" close tab
nnoremap <silent><localleader>; :tabclose<cr>

" quickfix open
nnoremap <silent><leader>co  :copen<cr>

" quickfix do
nnoremap <leader>cd   :cdo<space>

" quickfix open
nnoremap <silent><leader>cw  :cw<cr>

" grep
nnoremap <leader>/   :grep <space>
