" ---------- keybindings ------------------------------------------------------
" ----- jk to esc
inoremap jk <esc>

" ----- quit
nnoremap <silent><leader>q :quit<cr>
nnoremap <silent><localleader>q :quit!<cr>

" ----- write
nnoremap <leader>w :write<cr>
nnoremap <localleader>w :write ! sudo tee %<cr>

" ----- split panes
nnoremap <localleader>\ :vsplit<cr>
nnoremap <localleader>- :split<cr>

" ----- tabs
nnoremap <silent><localleader><tab> :tabnew<cr>
nnoremap <silent><localleader>h :tabprevious<cr>
nnoremap <silent><localleader>l :tabnext<cr>
nnoremap <silent><localleader>; :tabclose<cr>
