local utils = require 'utils'

utils.set_keymaps({
	o = { '<cmd>SymbolsOutline<cr>', 'Toggle Outline' },
}, { prefix = '<localleader>' })
