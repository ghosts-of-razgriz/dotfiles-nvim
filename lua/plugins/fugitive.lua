local fugitive_init = function()
	local leader = '<leader>'
	local localleader = '<localleader>'

	local opts = { noremap = true }

	vim.keymap.set('n', leader .. 'ga', '<cmd>Git add --patch<cr>', opts)
	vim.keymap.set('n', leader .. 'gb', '<cmd>Git blame<cr>', opts)
	vim.keymap.set('n', leader .. 'gc', '<cmd>Git commit<cr>', opts)
	vim.keymap.set('n', leader .. 'gd', '<cmd>Gdiff<cr>', opts)
	vim.keymap.set('n', leader .. 'gf', '<cmd>Git fetch<cr>', opts)
	vim.keymap.set(
		'n',
		leader .. 'gg',
		'<cmd>lua vim.cmd("Git " .. vim.fn.input("Git: "))<cr>',
		opts
	)
	vim.keymap.set(
		'n',
		leader .. 'gk',
		'<cmd>lua vim.cmd("Git checkout " .. vim.fn.input("Checkout: "))<cr>',
		opts
	)
	vim.keymap.set('n', leader .. 'gl', '<cmd>Git sla<cr>', opts)
	vim.keymap.set('n', leader .. 'gp', '<cmd>Git push<cr>', opts)
	vim.keymap.set('n', leader .. 'gs', '<cmd>Git<cr><c-w><s-h>', opts)
	vim.keymap.set('n', leader .. 'gw', '<cmd>Gwrite<cr>', opts)
	vim.keymap.set('n', leader .. 'ge', ':Gedit<space>', opts)

	vim.keymap.set('n', localleader .. 'gc', '<cmd>Git commit --amend<cr>', opts)
	vim.keymap.set('n', localleader .. 'gw', '<cmd>Git add --patch %<cr>', opts)
	vim.keymap.set('n', localleader .. 'gp', '<cmd>Git pull<cr>', opts)
end

return {
	'tpope/vim-fugitive',
	init = fugitive_init,
	event = 'VeryLazy',
}