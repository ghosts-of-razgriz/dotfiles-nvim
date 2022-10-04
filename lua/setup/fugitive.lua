local wk = require 'which-key'

wk.register({
	g = {
		name = 'Git',
		a = { '<cmd>Git add --patch<cr>', 'Add patch' },
		b = { '<cmd>Git blame<cr>', 'Blame' },
		c = { '<cmd>Git commit<cr>', 'Commit' },
		d = { '<cmd>Gdiff<cr>', 'Diff' },
		f = { '<cmd>Git fetch<cr>', 'Fetch' },
		g = { '<cmd>Git<space>', 'Git <prompt>' },
		k = { ':Git checkout<space>', 'Checkout <prompt>' },
		l = { '<cmd>Git pull<cr>', 'Pull' },
		p = { '<cmd>Git push<cr>', 'Push' },
		s = { '<cmd>Git<cr><c-w><s-h>', 'Status' },
		w = { '<cmd>Gwrite<cr>', 'Add' },
		e = { ':Gedit<space>', 'Edit <prompt>' },
	},
}, { prefix = '<leader>' })

wk.register({
	g = {
		name = 'Git',
		c = { '<cmd>Git commit --amend<cr>', 'Amend Commit' },
		w = { '<cmd>Git add --patch %<cr>', 'Add patch current file' },
	},
}, { prefix = '<localleader>' })
