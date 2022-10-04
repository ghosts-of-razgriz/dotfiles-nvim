" run last test ran
nnoremap <leader>tt     :TestLast<cr>
" run current test file
nnoremap <leader>tf     :TestFile<cr>
" run nearest test
nnoremap <leader>tn     :TestNearest<cr>
" run all tests
nnoremap <leader>ta     :TestSuite<cr>
" run all test - fail fast
nnoremap <leader>ts     :TestSuite --next-failure<cr>
" run current test file - fail fast
nnoremap <leader>tg     :TestFile --next-failure<cr>

let test#strategy = 'vtr'

function! DockerTransform(cmd) abort
  return 'docker-compose exec app ' . a:cmd
endfunction

" let g:test#custom_transformations = {'docker': function('DockerTransform')}
" let g:test#transformation = 'docker'

