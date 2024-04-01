return {
	'tpope/vim-fugitive',
	init = function()
		local leader = '<leader>'
		local localleader = '<localleader>'

		local opts = { noremap = true }

		-- vim.keymap.set('n', leader .. 'ga', '<cmd>Git add --patch<cr>', opts)
		vim.keymap.set('n', leader .. 'gb', '<cmd>Git blame<cr>', opts)
		-- vim.keymap.set('n', leader .. 'gc', '<cmd>Git commit<cr>', opts)
		-- vim.keymap.set('n', leader .. 'gd', '<cmd>Gdiff<cr>', opts)
		-- vim.keymap.set('n', leader .. 'gf', '<cmd>Git fetch<cr>', opts)
		-- vim.keymap.set(
		-- 	'n',
		-- 	leader .. 'gg',
		-- 	'<cmd>lua vim.cmd("Git " .. vim.fn.input("Git: "))<cr>',
		-- 	opts
		-- )
		-- vim.keymap.set(
		-- 	'n',
		-- 	leader .. 'gk',
		-- 	'<cmd>lua vim.cmd("Git checkout " .. vim.fn.input("Checkout: "))<cr>',
		-- 	opts
		-- )
		-- vim.keymap.set('n', leader .. 'gl', '<cmd>Git log --graph --oneline --decorate<cr>', opts)
		-- vim.keymap.set('n', leader .. 'gp', '<cmd>Git push<cr>', opts)
		vim.keymap.set('n', localleader .. 'gs', '<cmd>Git<cr>', opts)
		-- vim.keymap.set('n', leader .. 'gw', '<cmd>Gwrite<cr>', opts)
		-- vim.keymap.set('n', leader .. 'ge', ':Gedit<space>', opts)

		-- vim.keymap.set('n', localleader .. 'gc', '<cmd>Git commit --amend<cr>', opts)
		-- vim.keymap.set('n', localleader .. 'gw', '<cmd>Git add --patch %<cr>', opts)
		-- vim.keymap.set('n', localleader .. 'gp', '<cmd>Git pull<cr>', opts)
		-- vim.keymap.set('n', localleader .. 'gl', '<cmd>Git log --graph --decorate<cr>', opts)
	end,
	event = 'VeryLazy',
}
