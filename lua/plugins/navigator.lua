return {
	'numToStr/Navigator.nvim',
	config = function()
		local n = require('Navigator')
		n.setup()

		local opts = { silent = true, noremap = true }

		vim.keymap.set('n', '<M-h>', '<cmd>NavigatorLeft<cr>', opts)
		vim.keymap.set('n', '<M-j>', '<cmd>NavigatorDown<cr>', opts)
		vim.keymap.set('n', '<M-k>', '<cmd>NavigatorUp<cr>', opts)
		vim.keymap.set('n', '<M-l>', '<cmd>NavigatorRight<cr>', opts)
	end,
}
