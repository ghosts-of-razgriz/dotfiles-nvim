local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{ virtual_text = { spacing = 5, prefix = '' } }
)

require 'lsp.ccls'
require 'lsp.gopls'
require 'lsp.sumneko'
require 'lsp.tsserver'
require 'lsp.null_ls'
require 'lsp.lsp_lines'

local lspconfig = require 'lspconfig'

lspconfig.emmet_ls.setup {
	filetypes = { 'html', 'css', 'typescriptreact' },
}
-- lspconfig.tailwindcss.setup {}
