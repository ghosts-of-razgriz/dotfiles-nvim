local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{ virtual_text = { spacing = 5, prefix = '' } }
)

require 'lsp.sumneko'
require 'lsp.gopls'
require 'lsp.tsserver'
require 'lsp.null_ls'

local lspconfig = require 'lspconfig'

lspconfig.tailwindcss.setup {}
