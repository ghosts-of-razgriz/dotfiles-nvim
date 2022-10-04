" ----- global leader
 let g:mapleader = "\<space>"

 " ----- local leader
 let g:maplocalleader = "\<c-space>"

" ----- set confpath variable
let $CONFPATH = fnamemodify(expand('<sfile>'), ':h')

lua require 'init'
lua require 'plugins'
lua require 'pluginscolor'
