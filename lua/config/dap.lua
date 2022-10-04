local utils = require 'utils'

utils.set_keymap('n', '<m-d>b', '<cmd>lua require("dap").toggle_breakpoint()<cr>', utils.noresilent)
utils.set_keymap(
	'n',
	'<m-d>B',
	'<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>',
	utils.noresilent
)
utils.set_keymap(
	'n',
	'<m-d>p',
	'<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>',
	utils.noresilent
)
utils.set_keymap('n', '<m-d>R', '<cmd>lua require("dap").repl_open()<cr>', utils.noresilent)
utils.set_keymap('n', '<m-d>l', '<cmd>lua require("dap").run_last()<cr>', utils.noresilent)

utils.set_keymap('n', '<m-d><m-c>', '<cmd>lua require("dap").continue()<cr>', utils.noresilent)
utils.set_keymap(
	'n',
	'<m-d><m-x>',
	'<cmd>lua require("dap").reverse_continue()<cr>',
	utils.noresilent
)
utils.set_keymap('n', '<m-d><m-i>', '<cmd>lua require("dap").step_into()<cr>', utils.noresilent)
utils.set_keymap('n', '<m-d><m-o>', '<cmd>lua require("dap").step_out()<cr>', utils.noresilent)
utils.set_keymap('n', '<m-d><m-u>', '<cmd>lua require("dap").step_over()<cr>', utils.noresilent)
utils.set_keymap('n', '<m-d><m-h>', '<cmd>lua require("dap").step_back()<cr>', utils.noresilent)
utils.set_keymap('n', '<m-d><m-j>', '<cmd>lua require("dap").down()<cr>', utils.noresilent)
utils.set_keymap('n', '<m-d><m-k>', '<cmd>lua require("dap").up()<cr>', utils.noresilent)
utils.set_keymap(
	'n',
	'<m-d><m-g>',
	'<cmd>lua require("dap").goto_(vim.fn.input("Line #: "))<cr>',
	utils.noresilent
)
utils.set_keymap('n', '<m-d><m-r>', '<cmd>lua require("dap").run_to_cursor()<cr>', utils.noresilent)
utils.set_keymap('n', '<m-d><m-t>', '<cmd>lua require("dap").terminate()<cr>', utils.noresilent)

require 'dap'
require('dap-go').setup()

local signs = { Breakpoint = '🔴' }

for type, icon in pairs(signs) do
	local hl = 'Dap' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = '', linehl = '', numhl = '' })
end
