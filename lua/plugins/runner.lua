return {
	'MarcHamamji/runner.nvim',
	dependencies = { 'nvim-telescope/telescope.nvim' },
	cmd = { 'Runner', 'AutoRunner', 'AutoRunnerStop' },
	config = function()
		local r = require('runner')

		r.setup({
			position = 'bottom',
			height = 10,
		})
	end,
	init = function()
		local leader = '<leader>'
		local nore = { noremap = true }

		vim.keymap.set('n', leader .. 'rr', '<cmd>Runner<cr>', nore)
		vim.keymap.set('n', leader .. 'ra', '<cmd>AutoRunner<cr>', nore)
		vim.keymap.set('n', leader .. 'rs', '<cmd>AutoRunnerStop<cr>', nore)
	end,
}
