local c = require 'conform'

c.setup {}

if vim.fn.executable 'stylua' == 1 then
	c.formatters_by_ft.lua = { 'stylua' }
end

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	callback = function(args)
		require('conform').format { bufnr = args.buf }
	end,
})
