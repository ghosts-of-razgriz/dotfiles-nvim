return {
	'neovim/traverse.nvim',
	config = function()
		local t = require 'traverse'

		t.setup {
			mappings = {
				Left = '<c-h>',
				Down = '<c-j>',
				Up = '<c-k>',
				Right = '<c-l>',
			},
		}
	end,
	keys = { '<c-h>', '<c-j>', '<c-k>', '<c-l>' },
	url = 'https://gitlab.razgriz.io/neovim/traverse.nvim',
}
