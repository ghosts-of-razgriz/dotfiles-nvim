return {
	'Wansmer/treesj',
	keys = { 'gs' },
	config = function()
		local t = require('treesj')
		t.setup({
			use_default_keymaps = false,
		})

		vim.keymap.set('n', 'gs', t.toggle, { noremap = true })
	end,
}
