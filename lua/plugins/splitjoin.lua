-- return {
-- 	'echasnovski/mini.splitjoin',
-- 	config = function()
-- 		local s = require 'mini.splitjoin'

-- 		s.setup {
-- 			mappings = {
-- 				toggle = 'gs',
-- 			},
-- 		}
-- 	end,
-- 	keys = 'gs',
-- }
return {
	'Wansmer/treesj',
	keys = { 'gs' },
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	config = function()
		local t = require('treesj')

		t.setup({
			use_default_keymaps = false,
		})

		vim.keymap.set('n', 'gs', t.toggle, { noremap = true })
	end,
}
