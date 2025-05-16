return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
			opts = {
			columns = {
				'icon',
			},
			keymaps = {
				['<leader>q'] = 'actions.close',
				['<leader>x'] = { 'actions.toggle_trash', mode = 'n' },
				['g?'] = { 'actions.show_help', mode = 'n' },
				['<CR>'] = 'actions.select',
				['<C-t>'] = { 'actions.select', opts = { tab = true } },
				['<C-p>'] = 'actions.preview',
				['<C-c>'] = { 'actions.close', mode = 'n' },
				['<C-r>'] = 'actions.refresh',
				['-'] = { 'actions.parent', mode = 'n' },
				['_'] = { 'actions.open_cwd', mode = 'n' },
				['`'] = { 'actions.cd', mode = 'n' },
				['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
				['gs'] = { 'actions.change_sort', mode = 'n' },
				['gx'] = 'actions.open_external',
				['g.'] = { 'actions.toggle_hidden', mode = 'n' },
				['g\\'] = { 'actions.select', opts = { vertical = true } },
				['g-'] = { 'actions.select', opts = { horizontal = true } },
				['gh'] = '<cmd>edit $HOME<cr>',
			},
			use_default_keymaps = false,
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return name == '..'
				end,
			},
		},
	init = function()
		local leader = '<leader>'
		local nore = { noremap = true }

		vim.keymap.set('n', leader .. 'e', '<cmd>Oil<cr>', nore)
	end,
}
