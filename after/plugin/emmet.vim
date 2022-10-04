let g:user_emmet_install_global = 0

autocmd FileType html,css,javascript,javascriptreact,gohtmltmpl EmmetInstall

let g:user_emmet_leader_key='<c-e>'

let g:user_emmet_settings = {
\   'javascript' : {
\     'extends' : 'jsx',
\   },
\   'javascriptreact' : {
\     'extends' : 'jsx',
\   },
\ }

