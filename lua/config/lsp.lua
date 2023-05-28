local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰋽 ', Info = '󰌶 ' }

local utils = require 'utils'

for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{ virtual_text = { spacing = 5, prefix = ' ' } }
)

require 'lsp.gopls'
require 'lsp.lua_ls'
require 'lsp.null_ls'
require 'lsp.emmet_ls'
require 'lsp.pyright'
require 'lsp.vim_ls'
require 'lsp.dockerfile_ls'

utils.set_keymaps({
	['\\'] = { '<cmd>lua require "lsp.utils".toggle_formatting()<cr>', 'Toggle LSP Formatting' },
}, { prefix = '<leader>' })
