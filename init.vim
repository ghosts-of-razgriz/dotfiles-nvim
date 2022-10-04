" map leader keys
let g:mapleader = "\<space>"
let g:maplocalleader = "\<c-space>"

let $CONFPATH = fnamemodify(expand('<sfile>'), ':h')

" initialize packer
lua require 'init'
