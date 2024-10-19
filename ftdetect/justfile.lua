vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead' }, {
	pattern = { 'justfile'},
	callback = function()
		vim.cmd([[setlocal filetype=make]])
	end,
})
