-- autocmd BufNewFile,BufRead * if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = { '*.gohtml' },
	callback = function()
		if vim.fn.search('{{.+}}', 'nw') then
			vim.cmd([[setlocal filetype=gotmpl]])
		end
	end,
})
