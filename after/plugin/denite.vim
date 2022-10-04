" ----- denite mode key mapping -----------------------------------------------
autocmd FileType denite call s:denite_key_mapping()
function! s:denite_key_mapping() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> a denite#do_map('choose_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> ' denite#do_map('quick_move')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> r denite#do_map('do_action', 'quickfix')
  nnoremap <silent><buffer><expr> <C-r> denite#do_map('restore_sources')
endfunction
