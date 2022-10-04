local dapui = require 'dapui'
local utils = require 'utils'

dapui.setup {
	mappings = {
		expand = '<cr>',
		open = 'o',
		remove = 'd',
		edit = 'e',
		repl = 'r',
	},
}

utils.set_keymap('n', '<m-d><m-d>', '<cmd>lua require("dapui").toggle()<cr>', utils.noresilent)
