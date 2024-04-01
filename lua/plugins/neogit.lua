return {
	'NeogitOrg/neogit',
	branch = 'nightly',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sindrets/diffview.nvim',
		'nvim-telescope/telescope.nvim',
		'ibhagwan/fzf-lua',
	},
	cmd = { 'Neogit' },
	config = function()
		require('neogit').setup({})
	end,
	init = function()
		local leader = '<leader>'

		local opts = { noremap = true }
		vim.keymap.set('n', leader .. 'gs', '<cmd>Neogit<cr>', opts)
	end,
}
