return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('oil').setup({
			columns = {
				'icon',
			},
			keymaps = {
				['<leader>q'] = 'actions.close',
			},
		})
	end,
	init = function()
		local leader = '<leader>'
		local nore = { noremap = true }

		vim.keymap.set('n', leader .. 'e', '<cmd>Oil<cr>', nore)
	end,
}
