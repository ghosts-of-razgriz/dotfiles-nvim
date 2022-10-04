vim.call('defx#custom#option', '_', { columns = 'indent:icons:filename:indent:git:indent:time' })

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'defx' },
	callback = function()
		vim.schedule(function()
			DefxKeymap()
		end)
	end,
})
