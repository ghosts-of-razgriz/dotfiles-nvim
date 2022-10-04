local utils = require 'utils'

utils.set_keymaps({
	q = { '<cmd>quit<cr>', 'Quit' },
	w = { '<cmd>write<cr>', 'Write' },
	h = { '<cmd>set hlsearch!<cr>', 'Toggle Search Highlight' },
	['-'] = { '<cmd>wincmd _<cr><cmd>wincmd |<cr>', 'Zoom in' },
	['='] = { '<cmd>wincmd =<cr>', 'Zoom out' },
}, { prefix = '<leader>' })

utils.set_keymaps({
	q = { '<cmd>quit!<cr>', 'Force Quit' },
	a = { '<cmd>quitall!<cr>', 'Force Quit All' },
	['\\'] = { '<cmd>vsplit<cr>', 'Vertical Split' },
	['-'] = { '<cmd>split<cr>', 'Horizontal Split' },
	['<tab>'] = { '<cmd>tabnew<cr>', 'New Tab' },
	h = { '<cmd>tabprevious<cr>', 'Previous Tab' },
	l = { '<cmd>tabnext<cr>', 'Next Tab' },
}, { prefix = '<localleader>' })

utils.set_keymaps({
	j = {
		k = { '<esc>', 'Exit Insert Mode' },
	}
}, { mode = 'i' })
