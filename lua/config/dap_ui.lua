local dapui = require 'dapui'
local utils = require 'utils'

dapui.setup {}

utils.set_keymap('n', '<m-d><m-d>', '<cmd>lua require("dapui").toggle()<cr>', utils.noresilent)
