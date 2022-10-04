vim.call('defx#custom#option', '_', { columns = 'indent:icons:filename:indent:git:indent:time' })

vim.cmd [[autocmd FileType defx lua DefxKeymap()]]
