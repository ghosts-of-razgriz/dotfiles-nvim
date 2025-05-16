return {
	'NeogitOrg/neogit',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sindrets/diffview.nvim',
		'nvim-telescope/telescope.nvim',
	},
	dev = true,
	cmd = { 'Neogit' },
		opts = {
			commit_editor = {
				kind = 'vsplit',
			},
			sections = {
				recent = {
					folded = false,
					hidden = false,
					always = true,
				},
			},
		},
	init = function()
		local leader = '<leader>'

		local opts = { noremap = true }
		vim.keymap.set('n', leader .. 'gs', '<cmd>Neogit<cr>', opts)
	end,
}
