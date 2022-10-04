autocmd FileType defx call s:defx_settings()
function! s:defx_settings() abort
  " ----- defx mode settings --------------------------------------------------
  set number relativenumber
  " ----- defx mode key mapping -----------------------------------------------
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-p> defx#do_action('preview')
  nnoremap <silent><buffer><expr> <CR> defx#async_action('drop')
  nnoremap <silent><buffer><expr> - defx#async_action('multi', ['quit', ['drop', 'split']])
  nnoremap <silent><buffer><expr> \ defx#async_action('multi', ['quit', ['drop', 'vsplit']])
  nnoremap <silent><buffer><expr> <tab> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> O defx#async_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> h defx#async_action('cd', ['..'])
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> l defx#async_action('open')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> o defx#async_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ~ defx#async_action('cd')
endfunction
