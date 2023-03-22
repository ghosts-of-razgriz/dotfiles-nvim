vim.api.nvim_create_autocmd('BufRead,BufNewFile', {
	pattern = { '*/html/*.tmpl' },
	command = 'set filetype=gohtmltmpl',
})
