return {
	'Wansmer/treesj',
	keys = { 'gs' },
	opts = {
		use_default_keymaps = false,
	},
	config = function()
		local t = require('treesj')
		vim.keymap.set('n', 'gs', t.toggle, { noremap = true })
	end,
}
