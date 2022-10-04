ClearRegisters = function()
	local registers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'

	for c in registers:gmatch '.' do
		vim.call('setreg', c, {})
	end

	print 'Registers cleared!'
end

vim.api.nvim_set_keymap(
	'n',
	'<localleader>r',
	'<cmd>lua ClearRegisters()<cr>',
	{ noremap = true, silent = false }
)
