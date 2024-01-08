return {
	'neovim/nvim-lspconfig',
	name = 'lspconfig',
	lazy = false,
	config = function()
		local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰋽 ', Info = '󰌶 ' }

		for type, icon in pairs(signs) do
			local hl = 'DiagnosticSign' .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
		end

		vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics,
			{ virtual_text = { spacing = 5, prefix = ' ' } }
		)

		require 'lsp.conform'
	end,
	dependencies = {
		'stevearc/conform.nvim',
	},
}
