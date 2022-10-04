" open a runner
nnoremap <leader>vo             :VtrOpenRunner<cr>
" attach vtr to a pane
nnoremap <leader>va             :VtrAttachToPane<cr>
" send command previously sent to runner
nnoremap <leader>vv             :VtrSendCommand<cr>
" send new command to runner
nnoremap <leader>v<space>       :VtrSendCommand<space>
" send new command to runner for docker
nnoremap <localleader>v<space>  :VtrSendCommand docker-compose exec<space>
" kill runner
nnoremap <leader>vx             :VtrKillRunner<cr>

" open a rails console in docker container
nnoremap <leader>vc             :call VtrSendCommand(DockerTransform('spring rails console'))<cr>
" open a shell in docker container
let g:docker_shell_cmd = 'sh'
nnoremap <leader>vs             :call VtrSendCommand(DockerTransform(expand(g:docker_shell_cmd)))<cr>

" send ctrl-d to runner
nnoremap <leader>vd             :VtrSendCtrlD<cr>

" toggele clear before send
nnoremap <silent><leader>vt             :call VtrToggleClearBeforeSend()<cr>

function! VtrToggleClearBeforeSend() abort
  if g:VtrClearBeforeSend == 0
    let g:VtrClearBeforeSend = 1
    echo 'VtrClearBeforeSend Set'
  else
    let g:VtrClearBeforeSend = 0
    echo 'VtrClearBeforeSend Unset'
  endif
endfunction

